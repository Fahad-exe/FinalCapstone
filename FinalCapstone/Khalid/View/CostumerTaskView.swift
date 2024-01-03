import SwiftUI

struct CostumerTaskView: View {
    
    @StateObject var vm = ViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
            ScrollView{
                    

                VStack{
                    HStack {
                        Text(NSLocalizedString("add_new_order", comment: ""))
                            .multilineTextAlignment(.center)
                            .font(.title2)
                        .padding()
                        NavigationLink(destination: OrderServiceView()){
                            Image(systemName: "plus")
                                .foregroundStyle(colorScheme == .light ? .black : Color("btn"))
                                .padding()
                            
                        }
                    }
                    
                    //                        ForEach(vm.service){ services in
                    //                            VStack{
                    //                                HStack{
                    //                                    Text("22/12/2023")
                    //                                        .foregroundStyle(.invertedBK)
                    //                                    Spacer()
                    //                                    
                    //                                    Text(services.status)
                    //                                        .foregroundStyle(.invertedBK)
                    //                                        .background(RoundedRectangle(cornerRadius: 16).fill(.green.opacity(0.4)).frame(width: 103, height: 32))
                    //                                    
                    //                                }
                    //                                .padding()
                    //                                .frame(maxWidth: .infinity,alignment:.leading)
                    //                                Text(services.description)
                    //                                    .font(.title3)
                    //                                    .bold()
                    //                                    .padding(.horizontal)
                    //                                    .frame(maxWidth: .infinity, alignment:.leading)
                    //                                    .foregroundStyle(.invertedBK)
                    //                                Text("Completed at 20/12/2023")
                    //                                    .bold()
                    //                                    .padding(.horizontal)
                    //                                    .padding(.vertical,8)
                    //                                    .foregroundStyle(.green.opacity(0.8))
                    //                                    .frame(maxWidth: .infinity,alignment: .leading)
                    //                                ForEach(vm.provider){ providers in
                    //                                    HStack{
                    //                                        Image(systemName: "person")
                    //                                            .padding(.horizontal)
                    //                                        VStack{
                    //                                            Text(providers.name)
                    //                                                .frame(maxWidth: .infinity,alignment:.leading)
                    //                                                .foregroundStyle(.invertedBK)
                    //                                            Text("\(providers.id)")
                    //                                                .frame(maxWidth: .infinity,alignment:.leading)
                    //                                                .foregroundStyle(.invertedBK)
                    //                                        }
                    //                                        
                    //                                        
                    //                                        Image(systemName: "star.fill")
                    //                                            .padding(.horizontal)
                    //                                            .foregroundStyle(.yellow)
                    //                                        Text("4.7")
                    //                                            .foregroundStyle(.invertedBK)
                    //                                        
                    //                                        
                    //                                    }
                    //                                }
                    //                            }
                    //                            .padding()
                    //                            .frame(width: 327, height: 200)
                    //                            .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                    //                            .padding()
                    //                        }
                    VStack{
                        Text("Completed Tasks")
                            .foregroundStyle(.black.opacity(0.4))
                            .padding()
                            .frame(maxWidth: .infinity,alignment: .leading)
                        ForEach(vm.service){ services in
                            VStack{
                                HStack{
                                    Text("22/12/2023")
                                        .foregroundStyle(.invertedBK)
                                    Spacer()
                                    
                                    Text(services.status)
                                        .foregroundStyle(.invertedBK)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(.green.opacity(0.4)).frame(width: 103, height: 32))
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity,alignment:.leading)
                                Text(services.description)
                                    .font(.title3)
                                    .bold()
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment:.leading)
                                    .foregroundStyle(.invertedBK)
                                Text("Completed at 20/12/2023")
                                    .bold()
                                    .padding(.horizontal)
                                    .padding(.vertical,8)
                                    .foregroundStyle(.green.opacity(0.8))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                ForEach(vm.provider){ providers in
                                    HStack{
                                        Image(systemName: "person")
                                            .padding(.horizontal)
                                        VStack{
                                            Text(providers.name)
                                                .frame(maxWidth: .infinity,alignment:.leading)
                                                .foregroundStyle(.invertedBK)
                                            Text("\(providers.id)")
                                                .frame(maxWidth: .infinity,alignment:.leading)
                                                .foregroundStyle(.invertedBK)
                                        }
                                        
                                        
                                        Image(systemName: "star.fill")
                                            .padding(.horizontal)
                                            .foregroundStyle(.yellow)
                                        Text("4.7")
                                            .foregroundStyle(.invertedBK)
                                        
                                        
                                    }
                                }
                            }
                            .padding()
                            .frame(width: 327, height: 200)
                            .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                            .padding()
                        }
                    }
                }
                    
                    
                    
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack{
                            ForEach(vm.consumer, id: \.id) { consumers in
                                Text(NSLocalizedString("welcome, \(consumers.name)", comment: ""))
                                    .font(.title2)
                                    .foregroundStyle(colorScheme == .light ? .black : .white)
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: OrderServiceView()){
                            Image(systemName: "plus")
                                .foregroundStyle(colorScheme == .light ? .black : Color("btn"))
                            
                            
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
    CostumerTaskView()
}
