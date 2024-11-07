import SwiftUI
import Foundation

struct SettingView: View {
    let model: Model

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

                Button(action: {
                    model.events = []
                    model.types = []
                }) {
                    Label("Стереть", systemImage: "trash.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    SettingView(model: Model())
}
