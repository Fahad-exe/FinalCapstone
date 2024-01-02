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
                
                VStack(){
                    Text(NSLocalizedString("available_tasks", comment: ""))
                        .font(.headline)
                    
                    if pickedNumber == nil {
                        VStack{
                            ForEach(vm.service, id: \.id) { services in
                                ForEach(vm.consumer,id:\.id){ consumers in
                                    NavigationLink(destination: TaskDetailsView( customerName: consumers.name, serviceName: services.serviceName, servicePrice: services.price, serviceStatus: services.status, serviceDesc: services.description)) {
                                        
                                        VStack{
                                            HStack(alignment: .top){
                                                Text("\(services.serviceName)")
                                                    .font(.callout)
                                                    .foregroundStyle(Color.gray)
                                                
                                                Spacer()
                                                
                                                HStack{
                                                    Text("\(services.price) SAR")
                                                    
                                                    Text("\(services.status)")
                                                        .padding(.vertical, 3)
                                                        .padding(.horizontal, 5)
                                                        .foregroundStyle(Color.white)
                                                        .background(Color.cyan)
                                                        .cornerRadius(10)
                                                }
                                                .foregroundStyle(colorScheme == .light ? .black : .white)
                                            }
                                            
                                            Text("\(services.description)")
                                                .foregroundStyle(colorScheme == .light ? .black : .white)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            HStack(alignment: .bottom){
                                                Label(
                                                    title: {
                                                        Text("\(services.address)")
                                                            .font(.callout)
                                                            .foregroundStyle(colorScheme == .light ? .black : .white)
                                                    },
                                                    icon: {
                                                        Image(systemName: "location")
                                                            .foregroundStyle(colorScheme == .light ? .black : .white)
                                                    }
                                                )
                                                Spacer()
                                            }.padding()
                                        }
                                        .padding()
                                        .frame(width: 327, height: 200)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                                        .padding()
                                        
                                    }
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
