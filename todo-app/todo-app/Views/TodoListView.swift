import SwiftUI

// MARK: - TodoListView

/// タスク一覧画面
///
/// SwiftUIのViewは`struct`で定義し、`View`プロトコルに準拠する。
/// `body`プロパティでUIを宣言的に記述する。
struct TodoListView: View {

    /// サンプルデータ（Phase 2でViewModelに移行予定）
    private let sampleTasks = [
        (id: 1, title: "SwiftUIを学ぶ", isCompleted: false),
        (id: 2, title: "MVVMパターンを理解する", isCompleted: true),
        (id: 3, title: "Todoアプリを完成させる", isCompleted: false),
        (id: 4, title: "SwiftDataで永続化", isCompleted: false)
    ]

    /// `some View`: 不透明型（Opaque Type）
    /// 具体的な型を隠しつつ、Viewプロトコルに準拠することを保証する
    var body: some View {
        // NavigationStack: iOS 16+のナビゲーションコンテナ
        // iOS 16より前のNavigationViewの後継。型安全なナビゲーションが可能
        NavigationStack {
            // List: UIKitのUITableViewに相当するスクロール可能なリスト
            // ForEachと組み合わせてコレクションを表示する
            List {
                // ForEach: コレクションから動的にViewを生成
                // id: \.id でSwiftUIが各要素を識別し、効率的な差分更新を行う
                ForEach(sampleTasks, id: \.id) { task in
                    TaskRowView(
                        title: task.title,
                        isCompleted: task.isCompleted
                    )
                }
            }
            // View修飾子（Modifier）: Viewに対して見た目や動作を追加
            // 元のViewを変更せず、修飾された新しいViewを返す
            .navigationTitle("タスク一覧")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // TODO: Phase 2でタスク追加機能を実装
                    } label: {
                        // SF Symbols: Appleが提供する3,000以上のシステムアイコン
                        // https://developer.apple.com/sf-symbols/ で一覧確認可能
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

// MARK: - TaskRowView

/// 個々のタスクを表示する行コンポーネント
struct TaskRowView: View {
    let title: String
    let isCompleted: Bool

    var body: some View {
        // HStack: 水平方向のレイアウト（VStack: 垂直、ZStack: 重ね合わせ）
        HStack {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                // foregroundStyle: iOS 15+で導入。foregroundColorより柔軟で、
                // グラデーションやマテリアルにも対応
                .foregroundStyle(isCompleted ? .green : .gray)
                .font(.title2)

            Text(title)
                .strikethrough(isCompleted)
                // .primary/.secondary: システムの文字色に追従（ダークモード対応）
                .foregroundStyle(isCompleted ? .secondary : .primary)

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Preview

/// #Preview: Xcode 15+のプレビューマクロ
/// 従来の PreviewProvider より簡潔に記述できる
#Preview {
    TodoListView()
}
