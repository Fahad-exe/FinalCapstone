//
//  ChatRoomView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 24/12/2023.
//

import SwiftUI

struct ChatRoomView: View {
    @State var messageText = ""
    @Environment (\.dismiss) var dismiss
    @State var messages: [String] = []
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack{
            ScrollView {
                ForEach(messages, id: \.self) { index in
                    if index.contains("[USER]") {
                        let newIndex = index.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newIndex)
                                .padding()
                                .foregroundStyle(.invertedBK)
                                .background(.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    }else{
                        HStack {
                            Text(index)
                                .padding()
                                .foregroundStyle(.background)
                                .background(.invertedBK)
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }
                .rotationEffect(.degrees(180))
            }
                .rotationEffect(.degrees(180))
                .background(.gray.opacity(0.1))
            HStack {
                TextField("Enter the message", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(25)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Circle()
                            .foregroundStyle(.orange)
                        )
                }
                
            }
            .padding()
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.topBarLeading){
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundStyle(.orange)
                    }
                    Image(systemName: "person.circle")
                        .foregroundStyle(.orange)
                    VStack{
                        ForEach(vm.consumer){ consumers in
                            Text(consumers.name)
                            Text("customer")
                                .font(.caption2)
                                .foregroundStyle(.gray)
                        }
                       
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                }

            }
            ToolbarItem(placement: .topBarTrailing){
                HStack{
                    Button {
                        print("info")
                    } label: {
                        Image("info 1")
                    }
                    Button {
                        print("call")
                    } label: {
                        Image(systemName: "phone.fill")
                            .foregroundStyle(.green)
                    }

                }

            }
            
        }
    }
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getResponse(message: message))
            }
            
            
        }
    }
}
#Preview {
    ChatRoomView()
}

