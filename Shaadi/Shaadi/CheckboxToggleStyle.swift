
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

//struct CheckBox_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckBox()
//    }
//}



//// MARK: SecondSquareCheckboxToggleStyle CODE
//struct SecondContentView: View {
//    @State private var isOn2 = false
//
//    var body: some View {
//        Toggle("Hispanic or Latino: A person of Cuban, \nMexican, Puerto Rican, South or Central American, or other Spanish culture or \norigin regardless of race.", isOn: $isOn2)
//            .toggleStyle(SecondSquareCheckboxToggleStyle())
//            //.padding()
//    }
//}
//
//// MARK: SecondSquareCheckboxToggleStyle CODE
//struct SecondSquareCheckboxToggleStyle: ToggleStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 8) {
//                
//                RoundedRectangle(cornerRadius: 5.0)
//                    .stroke(lineWidth: 1)
//                    .frame(width: 20, height: 20)
//                    .cornerRadius(5.0)
//                    .overlay {
//                        Image(systemName: configuration.isOn ? "checkmark" : "")
//                            .foregroundStyle(.blue)
//                            .foregroundColor(.blue)
//                    }
//                    .onTapGesture {
//                        withAnimation(.spring()) {
//                            configuration.isOn.toggle()
//                        }
//                    }
//
//                Spacer()
//                    //.padding(.top,10)
//            }
//
//            configuration.label
//        }
//    }
//}
//
//struct SecondContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondContentView()
//    }
//}
