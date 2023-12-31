//
//  SettingsView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 23/12/2023.
//

import SwiftUI

struct SettingsView: View {
    @State var showNoti = false
    @State var showReminder = false
    @State var turnOffCamera = false
    var body: some View {
        VStack{
            Toggle("EnableNotification",isOn: $showNoti)
            Divider()
            Toggle("Showreminder",isOn: $showReminder)
            Divider()
            Toggle("TurnOffCamera",isOn: $turnOffCamera)
            Divider()
            Text("Languages")
                .fontWeight(.semibold)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            Button(action: {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }, label: {
                Text("ChangeLanguage")
                    .background(RoundedRectangle(cornerRadius: 4).fill(.clear).stroke(.orange,lineWidth:1).frame(width: 184, height: 40))
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding()
            Text("Password")
                .fontWeight(.semibold)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            Text("YouReset")
                .padding(.bottom)
                .font(.footnote)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
          
            Button(action: {print("Reset Password")}, label: {
                Text("RESETPASSWORD")
                    .background(RoundedRectangle(cornerRadius: 4).fill(.clear).stroke(.orange,lineWidth:1).frame(width: 184, height: 40))
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding(.horizontal)
        }
        .padding()
        .tint(.orange)
        Spacer()
    }
}

#Preview {
    SettingsView()
}
