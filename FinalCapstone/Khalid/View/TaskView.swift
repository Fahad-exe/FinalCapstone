import SwiftUI

struct TaskView: View {
    
    @StateObject var vm = ViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(colorScheme == .light ? Color("bck") : Color("bck"))
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    VStack{
                        ForEach(vm.consumer, id: \.id) { consumers in
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    Image("consumer")
                                    
                                    Text("\(consumers.name)")
                                        .font(.title3)
                                        .foregroundStyle(colorScheme == .light ? .black : .white)
                                    
                                    Spacer()
                                    
                                }
                                
                                ForEach(vm.service, id: \.id) { services in
                                    Text("Service Type: \(services.serviceName)")
                                        .font(.callout)
                                        .foregroundStyle(colorScheme == .light ? .black : .white)
                                    
                                }
                                HStack{
                                    Label(
                                        title: {
                                            Text("\(consumers.address)")
                                                .font(.callout)
                                                .foregroundStyle(colorScheme == .light ? .black : .white)
                                        },
                                        icon: {
                                            Image(systemName: "map")
                                                .foregroundStyle(colorScheme == .light ? .black : .white)
                                        }
                                    )
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: TaskDetailsView()) {
                                        Text(NSLocalizedString("show_details", comment: ""))
                                            .foregroundStyle(Color("statusColor"))
                                    }
                                }
                            }
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                            .padding()
                            .backgroundStyle(Color("hdr"))
                            .cornerRadius(10)
                        }
                    }
                    .padding()
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
    TaskView()
}
