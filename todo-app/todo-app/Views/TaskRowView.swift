import SwiftUI

struct TaskRowView: View {
    let item: TodoItem
    let onToggle: () -> Void
    let onUpdateTitle: (String) -> Void

    var body: some View {
        HStack {
            CheckboxButton(isChecked: item.isCompleted, action: onToggle)

            EditableText(
                text: item.titleValue,
                strikethrough: item.isCompleted,
                onSave: onUpdateTitle
            )

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    List {
        TaskRowView(
            item: TodoItem.samples[0],
            onToggle: {},
            onUpdateTitle: { _ in }
        )
        TaskRowView(
            item: TodoItem.samples[1],
            onToggle: {},
            onUpdateTitle: { _ in }
        )
    }
}
