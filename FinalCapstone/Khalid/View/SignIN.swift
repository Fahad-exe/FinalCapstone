import SwiftUI

struct SignIN: View {
    
    @State private var email: String = "example@exampla.com"
    @State private var password: String = "76596985"
    
    @State var isCliced: Bool = false
    
    @Environment(\.colorScheme) var colorScheme

    @State private var isRegisterationPresented = false

    var body: some View {
        
        ScrollView{
            
            VStack{
                Image("logo")
                
                Text("Get Things Done")
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.title3)
            }
            .frame(width: 301, height: 200)
            
            VStack(spacing: 40){
                
                VStack(spacing: 30){
                    HStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.gray)
                            .frame(width: 25, height: 25)
                        
                        TextField(NSLocalizedString("enter_email", comment: ""), text: $email)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                    }
                    .background(Color.gray.opacity(0.3)
                        .cornerRadius(16)
                        .frame(width: 350, height: 50, alignment: .center))
                    .padding(.horizontal)
                    
                    HStack{
                        
                        Image(systemName: "lock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.gray)
                            .frame(width: 25, height: 25)
                        
                        SecureField(NSLocalizedString("enter_password", comment: ""), text: $password)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                    }
                    .background(Color.gray.opacity(0.2)
                        .cornerRadius(16)
                        .frame(width: 350, height: 50, alignment: .center))
                    .padding(.horizontal)
                }
                
                Button(NSLocalizedString("no_account_click_here", comment: "")) {
                    isRegisterationPresented.toggle()
                }
                .foregroundColor(colorScheme == .light ? .black : .white)
                .sheet(isPresented: $isRegisterationPresented) {
                    RegisterationView(text: "")
                }
            }
            .padding(.horizontal)
            
            VStack{
                
                NavigationLink(destination: ProviderRootView())
                {
                    Text(NSLocalizedString("login", comment: ""))
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundColor(Color.orange))
                        .padding()
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal)
                }
        }
    }
}

#Preview {
    SignIN()
}
