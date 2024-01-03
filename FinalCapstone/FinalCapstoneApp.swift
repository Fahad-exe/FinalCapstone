//
//  FinalCapstoneApp.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 20/12/2023.
//

import SwiftUI

@main
struct FinalCapstoneApp: App {
    
    
    @AppStorage("100") var Entered : Bool = false
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            if Entered == true{
                ProviderRootView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            } else {
                OnBoardingView(Entered: $Entered)
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}
