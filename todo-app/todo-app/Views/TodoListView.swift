import SwiftUI

struct TodoListView: View {
    @State private var list = TodoList()

    var body: some View {
        NavigationStack {
            List {
                ForEach(list.items) { item in
                    TaskRowView(
                        item: item,
                        onToggle: { list.toggleCompletion(id: item.id) },
                        onUpdateTitle: { try? list.updateTitle(id: item.id, $0) }
                    )
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("タスク一覧")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear(perform: loadSampleData)
    }

    private func addItem() {
        if let newItem = try? TodoItem(title: "新しいタスク") {
            list.add(newItem)
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            list.remove(id: list.items[index].id)
        }
    }

    private func loadSampleData() {
        if list.items.isEmpty {
            TodoItem.samples.forEach { list.add($0) }
        }
    }
}

#Preview {
    TodoListView()
}
