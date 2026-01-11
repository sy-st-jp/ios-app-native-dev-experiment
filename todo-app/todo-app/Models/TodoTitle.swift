import Foundation

enum TodoTitleError: Error, Equatable {
    case empty
    case tooLong(maxLength: Int)
}

struct TodoTitle: Equatable {
    static let maxLength = 20

    let value: String

    init(_ value: String) throws {
        guard !value.isEmpty else {
            throw TodoTitleError.empty
        }
        guard value.count <= Self.maxLength else {
            throw TodoTitleError.tooLong(maxLength: Self.maxLength)
        }
        self.value = value
    }
}
