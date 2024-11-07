import SwiftUI
import Foundation

// функция для экспорта
func encode(model: Model){
    let encoder = JSONEncoder()
    let data = try! encoder.encode(model)
    print(String(data: data, encoding: .utf8)!)
}

// удаление всех данных модели
func deletedata(model: Model){
    model.events.removeAll()
    model.types.removeAll()

}

struct SettingView: View {
    let model: Model

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button(action: {
                    encode(model: model)
                }) {
                    Label("Экспорт", systemImage: "square.and.arrow.up")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }


                Button(action: {
                    // Действие для третьей кнопки
                    deletedata(model: model)
                }) {
                    Label("Удалить", systemImage: "trash.fill")
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
