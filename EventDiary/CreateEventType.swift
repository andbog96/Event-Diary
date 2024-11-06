import SwiftUI

extension Color {
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexSanitized)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let red = Double((color & 0xFF0000) >> 16) / 255.0
        let green = Double((color & 0x00FF00) >> 8) / 255.0
        let blue = Double(color & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

import SwiftUI

struct CreateEventType: View {
    @State private var eventName: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Отменить")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                
                Spacer()
                
                Text("Создать")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                
                Spacer()
                
                Text("Добавить")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
            }
            .padding(.horizontal, 20)
            .padding(.top, 70)
            
            
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 292, height: 93)
                    .cornerRadius(10)
                
                TextField("Название", text: $eventName, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
                .font(.system(size: 50))
                .padding(.horizontal, 90)
            }
            .padding(.vertical, 40)
            
            Spacer()
        }
        .background(Color(hex: "#D9D9D9"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CreateEventType_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventType()
    }
}

