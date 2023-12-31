//
//  ChatListView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 24/12/2023.
//

import SwiftUI

struct ChatListView: View {
    
    @StateObject var vm = ViewModel()
    @State private var searchText = ""
    var body: some View {
        VStack{
            ChatListViewModel(text: $searchText)
            List{
                ForEach(vm.consumer.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { consumers in
                    NavigationLink {
                        ChatRoomView()
                    } label: {
                        Text(consumers.name)
                    }
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
    ChatListView()
}
