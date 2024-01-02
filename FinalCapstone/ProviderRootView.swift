//
//  ContentView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 20/12/2023.
//

import SwiftUI

struct ProviderRootView: View {
    @AppStorage("9") var Entered : Bool = false
    @State var selection = 0
    @State var viewName: String = ""
    
    var body: some View {
        NavigationStack{
            
            if Entered == false{
                OnBoardingView(Entered: $Entered)
            } else{
                TabView(selection:$selection) {
                    ProviderHomeView()
                        .tabItem {
                            Image(systemName: "house")
                            
                        }
                        .tag(0)
                    
                    ProviderTaskView()
                    
                        .tabItem {
                            Image(systemName: "book.closed")
                        }
                        .tag(1)
                    
                    
                    CameraView()
                        .tabItem {
                            Image(systemName: "camera")
                            
                        }
                        .tag(2)
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                        }
                        .tag(4)
                    
                }
                .tint(.orange)
            }
            
        }
    }
}



#Preview {
    ProviderRootView()
}
