import SwiftUI

struct ContactPrivacyView: View {
    @ObservedObject var viewModel = ContactPrivacyViewModel()
    
    var body: some View {
        VStack {
            //MARK: Horizontal stack for "Show to all" and "Hide from all"
            HStack(spacing: 10) {
                ForEach([ContactPrivacyOption.showToAll, ContactPrivacyOption.hideFromAll],
                        id: \.self) { option in
                    Button(action: {
                        viewModel.selectedOption = option
                    }) {
                        Text(option.rawValue)
                            .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                            .frame(width: self.buttonWidth(for: option), height: 35)
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .inset(by: 1)
                                    .stroke(
                                        viewModel.selectedOption == option ? Color(red: 0.94, green: 0.29, blue: 0.29) : Color.gray,
                                        lineWidth: 1
                                    )
                            )
                    }
                }
            }
            .padding(.bottom, 10)
            
            //MARK: Vertical button for "Show to the members I express interest in"
            Button(action: {
                viewModel.selectedOption = .showToInterested
            }) {
                Text(ContactPrivacyOption.showToInterested.rawValue)
                    .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    .frame(width: self.buttonWidth(for: .showToInterested), height: 35)
                    .background(Color.white)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .inset(by: 1)
                            .stroke(
                                viewModel.selectedOption == .showToInterested ? Color(red: 0.94, green: 0.29, blue: 0.29) : Color.gray,
                                lineWidth: 1
                            )
                    )
            }
        }
        .padding()
    }
    
    private func buttonWidth(for option: ContactPrivacyOption) -> CGFloat {
        switch option {
        case .showToAll:
            return 111
        case .hideFromAll:
            return 130
        case .showToInterested:
            return 350 // Increased width
        }
    }
}




struct ContactPrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        ContactPrivacyView()
    }
}
