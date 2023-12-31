//
//  SecurityPrivacyView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 23/12/2023.
//

import SwiftUI
import Charts

struct ProfileView: View {
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
                HStack{
                    ForEach(vm.provider, id: \.id) { providers in
                        Image(systemName: "person")
                            .resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(.clear).stroke(.gray,lineWidth:1).frame(width: 80, height: 80))
                        VStack{
                            Text(providers.name)
                                .fontWeight(.bold)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                                .padding(.horizontal)
                            Text("ID \(providers.id)")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                                .padding(.horizontal)
                            HStack{
                                Text(providers.profession)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                                    .padding(.horizontal)
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Text("4.7")
                            }
                        }
                    }
                }
                .padding()
                VStack{
                    Menu{
                        Picker(selection:$sort, label: Text("Date")){
                            Text("Today").tag(0)
                            Text("ThisWeek").tag(1)
                            Text("ThisMonth").tag(2)
                        }
                    } label: {
                        HStack {
                            Text("Date")
                            Image(systemName: "arrow.down")
                        }
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .menuOrder(.fixed)
                    .padding(8)
                    HStack{
                        Text("18")
                            .foregroundStyle(.white)
                        Text("TotalHours")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("10")
                            .foregroundStyle(.white)
                        Text("TasksCompleted")
                            .foregroundStyle(.white)
                    }
                    Chart {
                        ForEach(ProfileData) { d in
                            
                            BarMark(x: .value("Day", d.day, unit: .day), y: .value("Hours", d.hours),width: 8)
                                .foregroundStyle(.white)
                            
                            
                        }
                        
                    }
                    .chartYAxis{
                        AxisMarks(stroke: StrokeStyle(lineWidth: 0))
                    }
                    .chartXAxis{
                        AxisMarks(stroke: StrokeStyle(lineWidth: 0))
                    }
                    .chartYAxis(.hidden)
                    
                    
                    
                }
                .frame(width: 327, height: 200)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(.orange))
                // End of Charts
                
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
    ProfileView()
}
