import SwiftUI

struct CheckboxButton: View {
    let isChecked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(isChecked ? .green : .gray)
                .font(.title2)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 20) {
        CheckboxButton(isChecked: false) {}
        CheckboxButton(isChecked: true) {}
    }
}
