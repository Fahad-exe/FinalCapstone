import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            
            Color(colorScheme == .light ? Color("bck") : Color("bck"))
                .ignoresSafeArea()
            
            ScrollView{
                
                VStack(spacing: 25){
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text(NSLocalizedString("demi", comment: ""))
                                .font(.headline)
                            
                            Spacer()
                            Text("5 min")
                                .foregroundStyle(Color.gray)
                        }
                        
                        Text(NSLocalizedString("replied_message", comment: ""))
                    }.padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            
                            Text("Salman")
                                .font(.headline)
                            Spacer()
                            Text("3 hrs ago")
                                .foregroundStyle(Color.gray)
                        }
                        
                        Text(NSLocalizedString("payment_completed", comment: ""))
                    }.padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            
                            Text(NSLocalizedString("system", comment: ""))
                                .font(.headline)
                            Spacer()
                            Text(NSLocalizedString("yesterday", comment: ""))
                                .foregroundStyle(Color.gray)
                        }
                        
                        Text(NSLocalizedString("nawaf", comment: ""))
                    }.padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
