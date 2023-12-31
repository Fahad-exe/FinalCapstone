import SwiftUI

struct AvailableTasks: View {
    
    @StateObject var vm = ViewModel()
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading){
                Text(NSLocalizedString("available_tasks", comment: ""))
                    .font(.headline)
                

            NavigationLink(destination: TaskDetailsView()) {
                
                ForEach(vm.service, id: \.id) { services in
                    
                    VStack(alignment: .leading){
                        
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
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
        }
    }
}
