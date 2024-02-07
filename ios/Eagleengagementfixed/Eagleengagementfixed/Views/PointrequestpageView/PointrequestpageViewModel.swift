import Foundation
import SwiftUI

class PointrequestpageViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var framethirtysevenPicker1: String = "Option 1"
    @Published var framethirtysevenPicker1Values: [String] = ["Option 1", "Option 2", "Option 3"]
    @Published var groupthreeText: String = ""
    @Published var labelOneCheckbox: Bool = false
}
