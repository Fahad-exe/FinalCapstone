import SwiftUI

struct ProviderHomeView: View {
    
    @StateObject var vm = ViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack{
                Color((colorScheme == .light ? "bck" : "bck"))
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    ProviderStatus()
                    
                    VStack(){
                        Text(NSLocalizedString("available_tasks", comment: ""))
                            .font(.headline)
                        
                        NavigationLink(destination: TaskDetailsView()) {
                            VStack{
                                ForEach(vm.service, id: \.id) { services in
                                    
                                    
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
                                        
                                        HStack(alignment: .bottom){
                                            Label(
                                                title: {
                                                    Text("\(services.address)")
                                                        .font(.callout)
                                                        .foregroundStyle(colorScheme == .light ? .black : .white)
                                                },
                                                icon: {
                                                    Image(systemName: "map")
                                                        .foregroundStyle(colorScheme == .light ? .black : .white)
                                                }
                                            )
                                            Spacer()
                                        }
                                    }
                                    .padding()
                                    .background(Color("hdr"))
                                    .cornerRadius(18)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack{
                            ForEach(vm.provider, id: \.id) { providers in
                                Text(NSLocalizedString("welcome, \(providers.name)", comment: ""))
                                
                                    .font(.title2)
                                    .foregroundStyle(colorScheme == .light ? .black : .white)
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: NotificationsView()){
                            Image(systemName: "bell")
                                .foregroundStyle(colorScheme == .light ? .black : Color("btn"))
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
}
#Preview {
    ProviderHomeView()
}
