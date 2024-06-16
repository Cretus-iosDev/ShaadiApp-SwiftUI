import SwiftUI

struct AuthenticationView: View {
    @State private var otp = ["", "", "", ""]
    @FocusState private var focusedField: Int?
    
    var phoneNumber: String
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        //MARK: Action to go back
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                
                Text("Enter Authentication Code")
                    .font(.custom(FontsManager.KumbhSans.SemiBold, size: 24))
                    .padding(.top, 40)
                
                Text("Enter 4-digit we have sent via the phone number \(phoneNumber)")
                    .font(.custom(FontsManager.KumbhSans.Regular, size: 19))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                
                HStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("", text: $otp[index])
                            .frame(width: 50, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(otp[index].isEmpty ? Color.gray : Color.red, lineWidth: 1)
                            )
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: index)
                            .onChange(of: otp[index]) { newValue in
                                if newValue.count == 1 {
                                    if index < 3 {
                                        focusedField = index + 1
                                    } else {
                                        focusedField = nil
                                    }
                                }
                            }

                    }
                }
                .padding(.vertical, 20)
                
                Spacer()
                
                Button(action: {
                    // Action to continue to login
                }) {
                    Text("Continue to Login")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(phoneNumber: "+91 7977828994")
    }
}
