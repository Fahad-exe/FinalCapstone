//
//  AboutView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 24/12/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Text("Our Story")
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Text("""
    Once upon a time, an entrepreneur witnessed a major problem: as companies scaled rapidly, they struggled to keep employees engaged, productive, and happy. the existing tools were not getting the job done. An effective, transparent platform for managing everything was desperately needed.
    """)
            .padding([.horizontal,.bottom])
            .foregroundStyle(.BK.opacity(0.8))
            Text("why Gethings Done?")
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Text("""
    Gethings Done is the most versatile task management software you’ll find on the market. You can use the platform to manage all of your tasks, and also use it as a CRM, to manage your company, track bugs, and manage cash flow.
    """)
            .padding([.horizontal,.bottom])
            .foregroundStyle(.BK.opacity(0.8))
            
            Text("How cool is Gethings Done?")
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            Text("""
    Gethings Done is the most versatile task management software you’ll find on the market. You can use the platform to manage all of your tasks, and also use it as a CRM, to manage your company, track bugs, and manage cash flow.
    """)
            .padding([.horizontal,.bottom])
            .foregroundStyle(.BK.opacity(0.8))
        }
        .padding()
    }
}

#Preview {
    AboutView()
}
