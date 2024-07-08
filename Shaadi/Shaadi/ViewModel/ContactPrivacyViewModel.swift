import SwiftUI

//MARK: ContactPrivacyViewModel
class ContactPrivacyViewModel: ObservableObject {
    @Published var selectedOption: ContactPrivacyOption = .showToAll
}
