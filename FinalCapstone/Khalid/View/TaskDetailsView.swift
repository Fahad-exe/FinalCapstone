import SwiftUI
import MapKit

struct TaskDetailsView: View {
    
    @StateObject var manager = LocationManager()
    @StateObject var vm = ViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showConfirmation = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(colorScheme == .light ? Color("bck") : Color("bck"))
                    .ignoresSafeArea()
                
                ScrollView{
                    ForEach(vm.consumer, id: \.id) { consumers in
                        
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("customer_information", comment: ""))
                                .foregroundStyle(Color.gray)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "person")
                                    NavigationLink {
                                        DashBoardView()
                                    } label: {
                                        Text("\(consumers.name)")
                                            .foregroundStyle(colorScheme == .light ? .black : .white)
                                    }

                                }
                                
                                
                            }
                            .font(.callout)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("hdr"))
                    .padding(.horizontal)
                    
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
                                        .background(Color("statusColor"))
                                        .cornerRadius(10)
                                }
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                            }
                            Text(NSLocalizedString("customer_note", comment: ""))
                                .foregroundStyle(Color.gray)
                            
                            Text("\(services.description)")
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                        .padding()
                        .background(Color("hdr"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading){
                        Text(NSLocalizedString("unit_information", comment: ""))
                            .foregroundStyle(Color.gray)
                        Text("LG Split AC")
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("hdr"))
                    .padding(.horizontal)
                    
                    ForEach(vm.consumer, id: \.id) { consumers in
                        
                        
                        
                        Map(coordinateRegion: $manager.region, showsUserLocation: true)
                            .frame(width: .infinity, height:  300)
                            .cornerRadius(10)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("hdr"))
                    .padding(.horizontal)
                    
                    Button(action: {
                        vm.updateService(status: "In Progress")
                        
                        self.showConfirmation.toggle()
                        
                    }){
                        Text(NSLocalizedString("take_task", comment: ""))
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .foregroundColor(Color("btn")))
                            .padding()
                    }
                    .padding(.horizontal)
                }
            }
            if showConfirmation {
                TaskConfirmation()
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
    TaskDetailsView()
}
