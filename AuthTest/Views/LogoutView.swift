//
//  LogoutView.swift
//  AuthTest
//
//  Created by Илья Груздев on 10.06.2021.
//

import SwiftUI

struct LogoutView: View {
    @StateObject private var loginVM = LoginViewModel()
    
    @State var test = ""
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Button("Logout", action: {
                loginVM.logout()
            })
                .frame(width: 200, height: 45)
                .background(Color(#colorLiteral(red: 0.9607843137, green: 0.8039215686, blue: 0.4745098039, alpha: 1)))
                .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
                .cornerRadius(6)
                .font(.custom("Lato", size: 16))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)) : Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView()
            
            
    }
}
