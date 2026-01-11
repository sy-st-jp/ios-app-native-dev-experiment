import Foundation

enum TodoDetailError: Error, Equatable {
    case tooLong(maxLength: Int)
}

struct TodoDetail: Equatable {
    static let maxLength = 100

    let value: String

    init(_ value: String = "") throws {
        guard value.count <= Self.maxLength else {
            throw TodoDetailError.tooLong(maxLength: Self.maxLength)
        }
        self.value = value
    }
}
