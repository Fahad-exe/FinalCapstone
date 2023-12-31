//
//  FinalCapstoneApp.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 20/12/2023.
//

import SwiftUI

@main
struct FinalCapstoneApp: App {
    @AppStorage("45") var Entered : Bool = false
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
         
                ProviderRootView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            
        }
    }
}
