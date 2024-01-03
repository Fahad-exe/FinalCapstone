import SwiftUI
import MapKit

struct TaskDetailsView: View {
    
    @StateObject var manager = LocationManager()
    @StateObject var vm = ViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var customerName: String?
    @State var serviceName: String?
    @State var servicePrice: Int?
    @State var serviceStatus: String?
    @State var serviceDesc: String?
    @State private var showConfirmation = false
    
    var body: some View {
            ZStack{
                Color(colorScheme == .light ? Color("bck") : Color("bck"))
                    .ignoresSafeArea()
                
                ScrollView{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("customer_information", comment: ""))
                                .foregroundStyle(Color.gray)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    
                                    NavigationLink {
                                        DashBoardView()
                                    } label: {
                                        
                                        Text("\(customerName ?? "nill")")
                                            .foregroundStyle(colorScheme == .light ? .black : .white)
                                    }

                                }
                                
                                
                            }
                            .font(.callout)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                    
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("hdr"))
                    .padding(.horizontal)
                    
                        
                        VStack(alignment: .leading){
                            
                            HStack(alignment: .top){
                                Text("\(serviceName ?? "Cannot find")")
                                    .font(.callout)
                                    .foregroundStyle(Color.gray)
                                
                                Spacer()
                                
                                HStack{
                                    Text("\(servicePrice ?? 000) SAR")
                                    
                                    Text("\(serviceStatus ?? "not found")")
                                        .padding(.vertical, 3)
                                        .padding(.horizontal, 5)
                                        .background(Color("statusColor"))
                                        .cornerRadius(10)
                                }
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                            }
                            Text(NSLocalizedString("customer_note", comment: ""))
                                .foregroundStyle(Color.gray)
                            
                            Text("\(serviceDesc ?? "cannot find description")")
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                        .padding()
                        .background(Color("hdr"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    
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
                            .frame(width: .infinity)
                            .frame(height:  300)
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
            .onAppear {
                vm.fetchConsumerData()
                vm.fetchProviderData()
                vm.fetchServiceData()
            }
            if showConfirmation {
                TaskConfirmation()
            }
        }
        
    }

#Preview {
    TaskDetailsView(customerName: "Hassan", serviceName: "Repair", servicePrice: 30, serviceStatus: "Complete", serviceDesc: "I need help")
}
