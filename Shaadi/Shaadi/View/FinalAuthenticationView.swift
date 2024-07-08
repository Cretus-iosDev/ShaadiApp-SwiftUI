

import SwiftUI

struct FinalAuthenticationView: View {
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
                
                Text("Enter the code sent on your \nnumber 📱")
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
                
                //MARK: Footer
                HStack {
                    Text("Didn’t get the OTP?")
                        .font(.custom(FontsManager.KumbhSans.Regular, size: 16))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    
                    Button(action: {
                        //MARK: Action for Log In button
                    }) {
                        Text("Resend Again")
                            .font(.custom(FontsManager.KumbhSans.Regular, size: 16))
                            .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29))
                    }
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: RegistrationSuccessView()) {
                    Text("Next")
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

#Preview {
    FinalAuthenticationView(phoneNumber: "+91 7977828994")
}
