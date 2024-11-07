import SwiftUI
import Foundation

struct SettingView: View {
    let model: Model

    @State private var isConfirmationDialogPresented = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ShareLink(item: String(data: try! JSONEncoder().encode(model), encoding: .utf8)!) {
                    Label("Экспорт", systemImage: "square.and.arrow.up")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button("Стереть", systemImage: "trash.fill") {
                    isConfirmationDialogPresented = true
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(model.events.isEmpty && model.types.isEmpty)
            }
            .padding()
            .navigationTitle("Настройки")
            .confirmationDialog("Удалить все данные?", isPresented: $isConfirmationDialogPresented) {
                Button("Удалить", role: .destructive) {
                    model.events = []
                    model.types = []
                }
            }
        }
    }
}

#Preview {
    SettingView(model: Model())
}
