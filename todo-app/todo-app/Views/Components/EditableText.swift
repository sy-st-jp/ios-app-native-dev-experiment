import SwiftUI

struct EditableText: View {
    let text: String
    let strikethrough: Bool
    let onSave: (String) -> Void

    @State private var isEditing = false
    @State private var editingText = ""
    @FocusState private var isFocused: Bool

    init(
        text: String,
        strikethrough: Bool = false,
        onSave: @escaping (String) -> Void
    ) {
        self.text = text
        self.strikethrough = strikethrough
        self.onSave = onSave
    }

    var body: some View {
        if isEditing {
            TextField("", text: $editingText)
                .focused($isFocused)
                .onSubmit { save() }
                .onChange(of: isFocused) { _, focused in
                    if !focused { save() }
                }
        } else {
            Text(text)
                .strikethrough(strikethrough)
                .foregroundStyle(strikethrough ? .secondary : .primary)
                .onTapGesture { startEditing() }
        }
    }

    private func startEditing() {
        editingText = text
        isEditing = true
        isFocused = true
    }

    private func save() {
        if !editingText.isEmpty && editingText != text {
            onSave(editingText)
        }
        isEditing = false
    }
}

#Preview {
    VStack(spacing: 20) {
        EditableText(text: "タップして編集") { _ in }
        EditableText(text: "完了済み", strikethrough: true) { _ in }
    }
    .padding()
}
