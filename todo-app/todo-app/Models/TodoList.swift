import Foundation

struct TodoList: Equatable {
    private(set) var items: [TodoItem] = []

    mutating func add(_ item: TodoItem) {
        items.append(item)
    }

    mutating func remove(id: UUID) {
        items.removeAll { $0.id == id }
    }

    mutating func updateTitle(id: UUID, _ title: String) throws {
        guard let index = items.firstIndex(where: { $0.id == id }) else {
            return
        }
        try items[index].updateTitle(title)
    }

    mutating func updateDetail(id: UUID, _ detail: String) throws {
        guard let index = items.firstIndex(where: { $0.id == id }) else {
            return
        }
        try items[index].updateDetail(detail)
    }

    mutating func toggleCompletion(id: UUID) {
        guard let index = items.firstIndex(where: { $0.id == id }) else {
            return
        }
        items[index].toggleCompletion()
    }
}
