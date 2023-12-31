//
//  TaskHistoryView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 26/12/2023.
//

import SwiftUI

struct TaskHistoryView: View {
    @StateObject var vm = ViewModel()

    var body: some View {
        ScrollView(showsIndicators:false){
            VStack{
                HStack{
                    Button(action: {
                        print("Overview")
                    }, label: {
                        Text("Overview")
                            .foregroundStyle(.invertedBK)
                            .background(RoundedRectangle(cornerRadius:16).fill(.orange).frame(width: 95, height: 32))
                    }).padding()
                    
                    Button(action: {
                        print("Unit Info")
                    }, label: {
                        Text("Unit Info")
                            .foregroundStyle(.invertedBK)
                            .background(RoundedRectangle(cornerRadius:16).fill(.dashclr).frame(width: 95, height: 32))
                    }).padding()
                    
                    Button(action: {
                        print("Notes")
                    }, label: {
                        Text("Notes")
                            .foregroundStyle(.invertedBK)
                            .background(RoundedRectangle(cornerRadius:16).fill(.dashclr).frame(width: 95, height: 32))
                    }).padding()
                        .background(.dashclr)
                }
                .padding()
                .background(.dashclr)
                Divider()
                
                VStack{
                    ForEach(vm.service, id: \.id) { services in
                        HStack{
                            Text("22/12/2023")
                            
                            Spacer()
                            Text("⏲ 2H")
                            
                                .foregroundStyle(.invertedBK)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).frame(width: 72, height: 32))
                                .padding(.horizontal)
                            Text(services.status)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.green).frame(width: 93, height: 32))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity,alignment:.leading)
                        VStack{
                            Text(services.description)
                                .font(.title3)
                                .bold()
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment:.leading)
                            Text("16 hours left")
                                .bold()
                                .padding(.horizontal)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        .padding()
                        .background(.dashclr)
                        }
                    }
                    
                    
                
                LazyVStack{
                    VStack{
                        Text("Unit Information")
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Text("LG S06EV4")
                            .frame(maxWidth: .infinity,alignment: .leading)
                        ScrollView(.horizontal){
                            LazyHStack{
                                Image(systemName: "person")
                                    .frame(width: 80, height: 80)
                                Image(systemName: "person")
                                    .frame(width: 80, height: 80)
                                Image(systemName: "person")
                                    .frame(width: 80, height: 80)
                            }
                        }
                    }
                    .padding()
                    .frame(width: 327, height: 216)
                    .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                    
                    VStack{
                        Text("Customer Notes")
                            .padding(.vertical,8)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Text("""
                                    this machine can't working well every i turn it on the AC always make a noisy sound, and the AC can always hot ever...
                                    """)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity,alignment: .topLeading)
                        
                    }
                    .padding()
                    .frame(width: 327, height: 212)
                    .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                    ForEach(vm.provider, id: \.id) { providers in
                    VStack{
                            Text(providers.profession)
                                .padding()
                                .frame(maxWidth: .infinity,alignment: .leading)
                            HStack{
                                Image(systemName: "person")
                                    .padding(.horizontal)
                                VStack{
                                    Text(providers.name)
                                        .frame(maxWidth: .infinity,alignment:.leading)
                                    Text("\(providers.id)")
                                        .frame(maxWidth: .infinity,alignment:.leading)
                                }
                                
                                
                                Image(systemName: "star.fill")
                                    .padding(.horizontal)
                                    .foregroundStyle(.yellow)
                                Text("4.7")
                                
                                
                            }
                            
                        }
                        .padding()
                        .frame(width: 327, height: 120)
                        .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr))
                        
                    }
                    
                }
                .padding()
                .ignoresSafeArea()
                .background(.gray.opacity(0.2))
                
            }
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            
        }
    }
}

#Preview {
    TaskHistoryView()
}
