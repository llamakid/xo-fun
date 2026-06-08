import SwiftUI
import GoogleMobileAds

@main
struct TicTacToeApp: App {
    init() {
        GADMobileAds.sharedInstance().requestConfiguration.tagForChildDirectedTreatment = true
        GADMobileAds.sharedInstance().start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
