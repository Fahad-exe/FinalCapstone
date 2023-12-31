import SwiftUI

struct TaskCompletionConfirmation: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack{
            
            ProviderTaskCompletion().opacity(0.1)
            
            VStack{
                Image("Image 1")
                    .resizable()
                    .scaledToFit()
                
                Text(NSLocalizedString("task_completion_message", comment: ""))
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color("btn"))
                
                Button(NSLocalizedString("dismiss_button", comment: "")) {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundStyle(Color.gray)
                .padding(.vertical, 5)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 522)
            .background(RoundedRectangle(cornerRadius: 16).fill(.BK))
            
            .padding()
        }
    }
}


#Preview {
    TaskCompletionConfirmation()
}
