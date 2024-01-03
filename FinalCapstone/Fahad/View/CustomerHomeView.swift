//
//  DashBoardView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 24/12/2023.
//

import SwiftUI

struct CustomerHomeView: View {
    @State  var rectangleSize: CGSize = CGSize(width: 400, height: 324)
    @State  var dragOffset: CGSize = .zero
    @State var pickedNumber: UUID?
    @Namespace var namespace
    @StateObject var vm = ViewModel()
    var body: some View {
        
        ScrollView(showsIndicators:false){
            LazyVStack{
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
                            .padding(.horizontal)
                    }
                    .padding()
                    .frame(idealWidth: 400,maxWidth: .infinity, maxHeight: .infinity)
                    .background(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 16,bottomTrailing:16)).fill(.dashclr).shadow(radius: 3,y:10))
                }
                
                
                //                    .frame(width: rectangleSize.width, height: rectangleSize.height)
                //
                //                )
                //                .gesture(
                //                    DragGesture()
                //                        .onChanged { value in
                //                            dragOffset = value.translation
                //                        }
                //                        .onEnded { value in
                //                            let swipeThreshold: CGFloat = 50
                //                            if dragOffset.height > swipeThreshold {
                //                                // Swipe down
                //                                rectangleSize = CGSize(width: rectangleSize.width, height: rectangleSize.height * 2)
                //                            } else if dragOffset.height < -swipeThreshold {
                //                                // Swipe up
                //                                rectangleSize = CGSize(width: rectangleSize.width, height: rectangleSize.height / 2)
                //                            }
                //
                //                            dragOffset = .zero
                //                        }
                //                )
                .padding(.vertical)
                
                Text("Completed_Tasks")
                    .foregroundStyle(.black.opacity(0.4))
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                if pickedNumber == nil {
                    VStack {
                        ForEach(vm.service){ services in
                            if services.status == "Complete"{
                                VStack{
                                    HStack{
                                        Text("22/12/2023")
                                            .foregroundStyle(.invertedBK)
                                        Spacer()
                                        Text(services.status)
                                            .padding()
                                            .foregroundStyle(.black)
                                            .background(RoundedRectangle(cornerRadius: 16).fill(.green).frame(width: 103, height: 32))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity,alignment:.leading)
                                    Text("Completed at 23/12/2023")
                                        .foregroundStyle(.green)
                                        .frame(maxWidth: .infinity,alignment:.leading)
                                        .padding()
                                    Text(services.description)
                                        .font(.title3)
                                        .bold()
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                        .foregroundStyle(.invertedBK)
                                    Spacer()
                                }
                                .padding()
                                .frame(width: 327, height: 200)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                                .padding()
                                .onTapGesture(count: 1) {
                                    withAnimation {
                                        pickedNumber = services.id
                                    }
                                    
                                }
                                .matchedGeometryEffect(id: services.id, in: namespace)
                            }
                        }
                    }
                    
                } else {
                    ForEach(vm.consumer){ consumers in
                        ForEach(vm.service) { services in
                            if pickedNumber == services.id {
                                ZStack {
                                    VStack{
                                        Button(action: {
                                            withAnimation {
                                                pickedNumber = nil
                                            }
                                        }, label: {
                                            Image(systemName: "chevron.backward")
                                        })
                                        .foregroundStyle(.orange)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                        TaskDetailsView( customerName: consumers.name, serviceName: services.serviceName, servicePrice: services.price, serviceStatus: services.status, serviceDesc: services.description)
                                    }
                                    
                                }
                                .matchedGeometryEffect(id: services.id, in: namespace)
                            }
                            
                        }
                    }
                }
            }
            
            .padding(.vertical)
            
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    CustomerHomeView()
}
