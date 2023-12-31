import SwiftUI
import MapKit

struct OrderServiceView: View {
    
    @StateObject var vm = ViewModel()
    
    @State var serviceName: String = ""
    @State var serviceDescription: String = ""
    @State var serviceAddress: String = ""
    @State var servicePrice: Int = 0
    
    @StateObject var manager = LocationManager()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Color(colorScheme == .light ? Color("bck") : Color("bck"))
                .ignoresSafeArea()
            
            ScrollView{
                
                VStack(alignment: .leading){
                    
                    Text(NSLocalizedString("enter_service_type", comment: ""))
                        .font(.callout)
                    TextField("(Repairs, Electronics, ...etc.)", text: $serviceName)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color("hdr"))
                        .cornerRadius(18)
                    
                    Text(NSLocalizedString("describe_problem", comment: ""))
                        .font(.callout)
                    TextField("(breif decription of your problem)", text: $serviceDescription)
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(Color("hdr"))
                        .cornerRadius(18)
                    
                    Text(NSLocalizedString("enter_address", comment: ""))
                    TextField(" ", text: $serviceAddress)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color("hdr"))
                        .cornerRadius(10)
                    
                    Spacer(minLength: 20)
                    
                    Text(NSLocalizedString("use_map", comment: ""))
                    Map(coordinateRegion: $manager.region, showsUserLocation: true)
                        .frame(maxWidth: .infinity, idealHeight:  300)
                        .cornerRadius(10)
                }
                .foregroundStyle(colorScheme == .light ? .black : .white)
                .padding()
                
                Button(action: {
                    vm.postData(serviceName: serviceName, description: serviceDescription, status: "Open", address: serviceAddress, price: servicePrice)
                  
                }) {
                    Text(NSLocalizedString("order", comment: ""))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .onTapGesture(perform: {
                    NavigationLink {
                        TaskConfirmation()
                    } label: {
                        Text("")
                    }

                })
               
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
    OrderServiceView()
}
