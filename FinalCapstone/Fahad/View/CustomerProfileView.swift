//
//  SecurityPrivacyView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 23/12/2023.
//

import SwiftUI
import Charts

struct CustomerProfileView: View {
    @Environment (\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") var isDarkMode = false
    @State var sort: Int = 0
    @State var showingWallet = false
    @State var showingLeader = false
   // @Binding var viewName: String
    @StateObject var vm = ViewModel()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(vm.consumer) { consumers in
                    VStack{
                        Image("consumer")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding(.top,16)
                            .foregroundStyle(.invertedBK)
                        Text(consumers.name)
                            .foregroundStyle(.invertedBK)
                        Text(consumers.address)
                            .foregroundStyle(.invertedBK)
                            .multilineTextAlignment(.center)
                            .padding([.horizontal,.bottom])
                    }
                    .padding(.top)
                    .frame(idealWidth: 400,maxWidth: .infinity, maxHeight: .infinity)
                    .background(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 16,bottomTrailing:16)).fill(.dashclr).shadow(radius: 3,y:10))
                }
                
                VStack{
                    Button(action: {
                        showingWallet.toggle()
                    }, label: {
                        HStack{
                            Image(isDarkMode ? "wallet" : "wallet 1")
                            Text("MyBalance")
                                .foregroundStyle(.invertedBK)
                            Spacer()
                            Text("$1,560")
                            Image(systemName: "chevron.forward")
                        }
                    })
                    .frame(width: 320, height: 64)
                    .tint(.BK)
                    .sheet(isPresented: $showingWallet){
                        Text("Wallet")
                    }
                    Divider()
                    
                    Button(action: {
                        showingLeader.toggle()
                    }, label: {
                        HStack{
                            Image(isDarkMode ? "award 1" : "award")
                            Text("Leaderboard")
                                .foregroundStyle(.invertedBK)
                            Spacer()
                            Text("Pos. 12th")
                            Image(systemName: "chevron.forward")
                        }
                    })
                    .frame(width: 320, height: 56)
                    .tint(.BK)
                    .sheet(isPresented: $showingLeader){
                        Text("leader")
                    }
                    Divider()
                    NavigationLink {
                        SettingsView()
                    }label: {
                        HStack{
                            Image(isDarkMode ? "setting" : "setting 1")
                            Text("Settings")
                                .foregroundStyle(.invertedBK)
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                    }
                    .frame(width: 320, height: 56)
                    .tint(.BK)
                    
                    
                    Divider()
                    
                    Button(action: {
                        isDarkMode.toggle()
                    }, label: {
                        HStack{
                            Image(isDarkMode ? "theme 1" : "theme")
                            Toggle("DarkMode", isOn: $isDarkMode)
                                .foregroundStyle(.invertedBK)
                        }
                    })
                    .frame(width: 320, height: 56)
                    .tint(.orange)
                    
                    Divider()
                    
                    NavigationLink {
                        AboutView()
                    } label: {
                        HStack{
                            Image(isDarkMode ? "info" : "info 1")
                            Text("About")
                                .foregroundStyle(.invertedBK)
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                    }
                    .frame(width: 320, height: 56)
                    .tint(.BK)
                    
                    Button(action: {
                        print("Log Out")
                    }, label: {
                        HStack{
                            Image(isDarkMode ? "logout 1" : "logout")
                            Text("Logout")
                        }
                        .frame(width: 326, height: 48)
                        .background(RoundedRectangle(cornerRadius: 16).fill(.clear).stroke(.orange,lineWidth: 1).frame(width: 326, height: 48))
                        .padding()
                        .tint(.BK)
                        
                    })
                    
                }
                .padding(.horizontal)
                
                
                
                
            }
            .padding()
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            
            //viewName = "Profile"
            
        }
        .scrollIndicators(.hidden)
    }
    
}

#Preview {
    CustomerProfileView()
}
