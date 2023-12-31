import SwiftUI

struct ProviderTaskCompletion: View {
    
    @StateObject var vm = ViewModel()
    @State var ReviewFeedBack: String = ""
    @State var Review = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
            ScrollView{
                VStack{
                    HStack{
                        Text(NSLocalizedString("task_complete", comment: ""))
                        Spacer()
                        
                        ForEach(vm.service, id: \.id) { services in
                            Text("\(services.status)")
                                .foregroundColor(Color("statusColor"))
                        }
                    }
                    HStack{
                        Text(NSLocalizedString("work_rate", comment: ""))
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                        
                        Spacer()
                        ForEach(1..<6) { index in
                            Image(systemName: index <= self.Review ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    self.Review = index
                                }
                        }
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("hdr"))
                .padding(.horizontal)
                
                VStack(alignment: .leading){
                    Text(NSLocalizedString("feedback_consumer", comment: ""))
                        .foregroundStyle(Color.gray)
                    TextField("", text: $ReviewFeedBack)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("hdr"))
                .padding(.horizontal)
                
                Button(action: {
                    vm.updateService(status: "Complete")
                    vm.postReview(ReviewFeedBack: ReviewFeedBack, Review: Review)
                }) {
                    Text(NSLocalizedString("finish", comment: ""))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            vm.fetchTaskData()
            vm.fetchReviewsData()
        }
    }
}

#Preview {
    ProviderTaskCompletion()
}
