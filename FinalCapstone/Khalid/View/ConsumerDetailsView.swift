import SwiftUI
import MapKit


struct ConsumerDetailsView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @StateObject var vm = ViewModel()
    
    @State private var isSheetPresented = false
    @State private var selectedOption: String? = nil
    
    let phoneNumber = "1234567890"
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showingCustomAlert = false

    var body: some View {
        ZStack{
            
            Color("bck")
                .ignoresSafeArea()
            
            ScrollView{
                
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
                        Text(NSLocalizedString("unit_information", comment: ""))
                            .foregroundStyle(Color.gray)

                        Text("\(services.description)")
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                        
                        Spacer(minLength: 25)
                        
                        ForEach(vm.provider, id: \.id) { providers in
                            Label(
                                title: {
                                    Text("\(providers.name) (You)")
                                        .foregroundStyle(colorScheme == .light ? .black : .white)
                                },
                                icon: {
                                    Image("provider")
                                }
                            )
                            Text("#\(providers.id)")
                                .font(.callout)
                        }
                    }
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    .padding()
                    .background(Color("hdr"))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading){
                    Text(NSLocalizedString("customer_note", comment: ""))
                        .foregroundStyle(Color.gray)
                    
                    Text("LG Split AC")
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("hdr"))
                .padding(.horizontal)
                
                ForEach(vm.consumer, id: \.id) { consumers in
                    
                    VStack(alignment: .leading){
                        Text(NSLocalizedString("customer_information", comment: ""))
                            .foregroundStyle(Color.gray)
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("\(consumers.name)")
                                .font(.callout)
                            Label(
                                title: {
                                    Text("\(consumers.address)")
                                },
                                icon: {
                                    Image(systemName: "map")
                                }
                            )
                        }
                        .font(.callout)
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                    
                    Map(coordinateRegion: $region)
                        .frame(width: .infinity, height: 200)
                        .cornerRadius(20)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("hdr"))
                .padding(.horizontal)
                
                
                HStack{
                    VStack{
                        Button (action: {
                            showingCustomAlert = true

//                            isSheetPresented.toggle()
                        }) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundStyle(Color.white)
                            Text(NSLocalizedString("update_task", comment: ""))
                                .frame(width: 150, height: 50)
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal)
                        .background(Color.orange)
                        .cornerRadius(20)
                    }
                    
                    Button(action: {
                        if let phoneURL = URL(string: "tel:053502352") {
                            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                        }
                    }) {
                        Image(systemName: "phone")
                            .frame(width: 70, height: 50)
                            .background(Color.green)
                            .cornerRadius(20)
                    }
                    
                    Image(systemName: "message")
                        .frame(width: 70, height: 50)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .padding()
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
    ConsumerDetailsView()
}
