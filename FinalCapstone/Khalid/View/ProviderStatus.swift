import SwiftUI

struct ProviderStatus: View {
    
    @StateObject var vm = ViewModel()
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView(.horizontal) {
            
            ForEach(vm.provider, id: \.id) { providers in
                
                HStack(spacing: 15) {
                    
                    VStack(alignment: .leading){
                        
                        Text(NSLocalizedString("my_status", comment: ""))
                            .foregroundStyle(Color.white)
                        
                        HStack{
                            Image(systemName: providers.Status ? "circle.fill" : "circle")
                                .foregroundStyle(Color.white)
                            
                            Text(providers.Status ? "Active" : "Not Active")
                                .font(.title3)
                                .foregroundStyle(Color.white)
                        }
                    }
                    .frame(width: 200, height: 80)
                    .background(providers.Status ? Color("statusColor") : Color.gray)
                    .cornerRadius(20)
                    
                    
                    VStack(alignment: .leading){
                        Text(NSLocalizedString("total_work_time", comment: ""))
                            .foregroundStyle(Color.white)
                        HStack{
                            Image(systemName: "clock")
                                .foregroundStyle(Color.white)
                            Text("\(providers.totalWorkTime) hours")
                                .font(.title3)
                                .foregroundStyle(Color.white)
                        }
                    }.frame(width: 200, height: 80)
                        .background(Color.red)
                        .cornerRadius(20)
                }
            }.padding(.horizontal)
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
        }

    }
}

//#Preview {
//    ProviderStatus()
//}

