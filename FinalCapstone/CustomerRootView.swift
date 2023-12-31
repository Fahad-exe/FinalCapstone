//
//  ContentView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 20/12/2023.
//

import SwiftUI

struct CustomerRootView: View {
    @AppStorage("9") var Entered : Bool = false
    @State var selection = 0
    @State var viewName: String = ""
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack{
                VStack{
                    TabView(selection:$selection) {
                        CustomerHomeView()
                            .tabItem {
                                Image(systemName: "house")
                                
                            }
                            .tag(0)
                        CostumerTaskView()
                            
                            .tabItem {
                                Image(systemName: "book.closed")
                            }
                            .tag(1)
                            .navigationBarTitleDisplayMode(.automatic)
                            .padding(.top, 2)
                        CameraView()
                            .tabItem {
                                Image(systemName: "camera")
                                
                            }
                            .tag(2)
                        ChatListView()
                            .tabItem {
                                Image(systemName: "message")
                                
                            }
                            .tag(3)
                        
                        ProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Circle()
                                
                                
                            }
                            .tag(4)
                        
                    }
                    .tint(.brown)
                    
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }


#Preview {
    CustomerRootView()
}
