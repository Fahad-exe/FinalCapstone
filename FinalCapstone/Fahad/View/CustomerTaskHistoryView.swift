//
//  TaskHistoryView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 26/12/2023.
//

import SwiftUI

struct CustomerTaskHistoryView: View {
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
                ForEach(vm.service, id: \.id) { services in
                    VStack{
                        HStack{
                            Text("22/12/2023")
                            
                            Spacer()
                            Text("⏲ 2H")
                            
                                .foregroundStyle(.BK)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.invertedBK).frame(width: 72, height: 32))
                                .padding(.horizontal)
                            Text(services.status)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.yellow).frame(width: 93, height: 32))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity,alignment:.leading)
                        Text(services.description)
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment:.leading)
                        Text("16 hours left")
                            .bold()
                            .padding([.horizontal,.bottom])
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        HStack{
                            Text("Started ")
                                .foregroundStyle(.invertedBK.opacity(0.6))
                            Text("21/12/2023 1:40PM")
                            
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        HStack{
                            Text("Completed ")
                                .foregroundStyle(.invertedBK.opacity(0.6))
                            Text("22/12/2023 8:20AM")
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    .padding()
                    .background(.dashclr)
                }
                LazyVStack{
                    VStack{
                        HStack{
                            Text("Task Completion")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.black, .green)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity,alignment:.leading)
                        HStack{
                            Text("Cleanliness")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.black, .green)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity,alignment:.leading)
                        HStack{
                            Text("Customer Approval")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.black, .green)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity,alignment:.leading)
                        Divider()
                        HStack{
                            Text("Work Rating")
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity,alignment:.leading)
                    }
                    .padding()
                    .frame(width: 327, height: 216)
                    .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                    
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
                    .frame(width: 327, height: 212)
                    .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                    ForEach(vm.provider){ providers in
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
                            Divider()
                            HStack{
                                Button(action: {
                                    if let url = NSURL(string: "tel://\(providers.contactInfo)"), UIApplication.shared.canOpenURL(url as URL) {
                                        UIApplication.shared.open(url as URL )
                                    }
                                }, label: {
                                    Image("call")
                                   
                                })
                                .padding()
                                Button(action: {
                                    print("call")
                                }, label: {
                                    Image("chat")
                                        
                                })
                                .padding()
                                Button(action: {
                                    print("call")
                                }, label: {
                                    Image("email")
                                      
                                })
                                .padding(.horizontal)
                            }
                            
                        }
                        .padding()
                        .frame(width: 327, height: 194)
                        .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                        
                    }
                }
                .padding()
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
    CustomerTaskHistoryView()
}
