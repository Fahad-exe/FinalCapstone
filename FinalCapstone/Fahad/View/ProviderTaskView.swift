//
//  ProviderTaskView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 31/12/2023.
//

import SwiftUI

struct ProviderTaskView: View {
    @StateObject var vm = ViewModel()
    @State var pickedNumber: UUID?
    @Namespace var namespace
    
    var body: some View {
        ScrollView{
            
            
            VStack{
                
                Text("Tasks")
                    .font(.title)
                    .bold()
                if pickedNumber == nil {
                    VStack {
                        Text("Open_Tasks")
                            .foregroundStyle(.black.opacity(0.4))
                            .padding()
                            .frame(maxWidth: .infinity,alignment: .leading)
                        ForEach(vm.service){ services in
                            if services.status == "Open"{
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
                        Text("In_Progress_Tasks")
                            .foregroundStyle(.black.opacity(0.4))
                            .padding()
                            .frame(maxWidth: .infinity,alignment: .leading)
                        
                        ForEach(vm.service){ services in
                            if services.status == "In Progress"{
                                VStack{
                                    HStack{
                                        Text("22/12/2023")
                                            .foregroundStyle(.invertedBK)
                                        Spacer()
                                        
                                        Text(services.status)
                                            .foregroundStyle(.invertedBK)
                                            .background(RoundedRectangle(cornerRadius: 16).fill(.yellow.opacity(0.4)).frame(width: 103, height: 32))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity,alignment:.leading)
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
                        
                        Text("Completed_Tasks")
                            .foregroundStyle(.black.opacity(0.4))
                            .padding()
                            .frame(maxWidth: .infinity,alignment: .leading)
                        ForEach(vm.service){ services in
                            if services.status == "Complete"{
                                VStack{
                                    HStack{
                                        Text("22/12/2023")
                                            .foregroundStyle(.invertedBK)
                                        Spacer()
                                        
                                        Text(services.status)
                                            .foregroundStyle(.invertedBK)
                                            .background(RoundedRectangle(cornerRadius: 16).fill(.gray.opacity(0.4)).frame(width: 103, height: 32))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity,alignment:.leading)
                                    Text(services.description)
                                        .font(.title3)
                                        .bold()
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                        .foregroundStyle(.invertedBK)
                                    Text("Completed at 20/12/2023")
                                        .bold()
                                        .padding(.horizontal)
                                        .padding(.vertical,8)
                                        .foregroundStyle(.green.opacity(0.8))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    ForEach(vm.provider){ providers in
                                        HStack{
                                            Image(systemName: "person")
                                                .padding(.horizontal)
                                            VStack{
                                                Text(providers.name)
                                                    .frame(maxWidth: .infinity,alignment:.leading)
                                                    .foregroundStyle(.invertedBK)
                                                Text("\(providers.id)")
                                                    .frame(maxWidth: .infinity,alignment:.leading)
                                                    .foregroundStyle(.invertedBK)
                                            }
                                            
                                            
                                            Image(systemName: "star.fill")
                                                .padding(.horizontal)
                                                .foregroundStyle(.yellow)
                                            Text("4.7")
                                                .foregroundStyle(.invertedBK)
                                            
                                            
                                        }
                                    }
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
            
            
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            
        }
    }
}

#Preview {
    ProviderTaskView()
}
