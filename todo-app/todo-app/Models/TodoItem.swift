import Foundation

struct TodoItem: Identifiable, Equatable {
    let id: UUID
    private var title: TodoTitle
    private var detail: TodoDetail
    private(set) var isCompleted: Bool
    let createdAt: Date

    var titleValue: String { title.value }
    var detailValue: String { detail.value }

    init(
        id: UUID = UUID(),
        title: String,
        detail: String = "",
        isCompleted: Bool = false,
        createdAt: Date = Date()
    ) throws {
        self.id = id
        self.title = try TodoTitle(title)
        self.detail = try TodoDetail(detail)
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }

    mutating func toggleCompletion() {
        isCompleted.toggle()
    }

    mutating func updateTitle(_ title: String) throws {
        self.title = try TodoTitle(title)
    }

    mutating func updateDetail(_ detail: String) throws {
        self.detail = try TodoDetail(detail)
    }
}

// MARK: - Sample Data

extension TodoItem {
    static let samples: [TodoItem] = [
        try! TodoItem(
            title: "SwiftUIを学ぶ",
            detail: "基本的なViewの構築方法を理解する"
        ),
        try! TodoItem(
            title: "MVVMパターンを理解する",
            isCompleted: true
        ),
        try! TodoItem(
            title: "Todoアプリを完成させる"
        ),
        try! TodoItem(
            title: "SwiftDataで永続化",
            detail: "Phase 4で実装予定"
        )
    ]
}
