import SwiftUI

struct RegisterationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var email = ""
    @State private var password = ""
    @State private var isRegisterationPresented = false
    
    @State var text: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Color((colorScheme == .light ? "bck" : "bck"))
                .ignoresSafeArea()

        VStack{
            VStack(spacing: 30){
                HStack{
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.gray)
                        .frame(width: 25, height: 25)
                    
                    TextField(NSLocalizedString("enter_email", comment: ""), text: $email)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                }
                .background(Color.gray.opacity(0.2)
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
            .padding(.horizontal)
            
            Button {
                
                dismiss.callAsFunction()
            } label: {
                Text(NSLocalizedString("register_button", comment: ""))
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .foregroundStyle(Color("btn")))
                    .padding()
            }
            .padding(.top, 12)
            .padding(.horizontal, 24)
        }
    }
}
}

#Preview {
    RegisterationView(text: "")
}
