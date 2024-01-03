import SwiftUI

struct ProviderHomeView: View {
    
    @StateObject var vm = ViewModel()
    @State var pickedNumber: UUID?
    @Namespace var namespace
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack{
            //                Color((colorScheme == .light ? "bck" : "bck"))
            //                    .ignoresSafeArea()
            //
            ScrollView{
                
                ProviderStatus()
                
                VStack{
                    Text(NSLocalizedString("available_tasks", comment: ""))
                        .font(.headline)
                        .padding()
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
                .padding(.horizontal)
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
    
    ProviderHomeView()
}
