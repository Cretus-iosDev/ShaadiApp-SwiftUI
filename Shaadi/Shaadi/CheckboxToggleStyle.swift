
import SwiftUI

struct CheckBox: View {
    @Binding var isChecked: Bool
    var label: () -> Text
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 1)
                    .frame(width: 20, height: 20)
                    .cornerRadius(5.0)
                    .overlay {
                        Image(systemName: isChecked ? "checkmark" : "")
                            .foregroundColor(isChecked ? .blue : .clear)
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isChecked.toggle()
                        }
                    }
                
                label()
            }
            
//            // Spacer to align text below checkbox
//            if !isChecked {
//               // Spacer()
//            }
        }
    }
}
struct SquareCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 1)
                .frame(width: 20, height: 20)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .foregroundStyle(.blue)
                        .foregroundColor(.blue)
                        
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }

            configuration.label
        }
    }
}

