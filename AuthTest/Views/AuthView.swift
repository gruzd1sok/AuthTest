//
//  AuthView.swift
//  AuthTest
//
//  Created by Илья Груздев on 10.06.2021.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var keyboardHandler = KeyboardHandler()
    @Environment (\.colorScheme) var colorScheme
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .scaledToFit()
                
                VStack {
                    Text("The story begins")
                        .font(.custom("Merriweather", size: 24))
                        .fontWeight(.light)
                        .frame(maxWidth: 375, maxHeight: 30)
                        .lineLimit(0)
                        .padding(.top, 96)
                    
                    Text("Discover an amazing way\n to write and read stories")
                        .font(.custom("Merriweather", size: 13))
                        .fontWeight(.light)
                        .lineLimit(2)
                        .frame(height: 36)
                        .frame(maxWidth: 375)
                        .padding(.top, 12)
                }
                .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)) : Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)))
                
                VStack {
                    VStack {
                        TextField("  Email", text: $loginVM.email)
                            .frame(height: 40)
                            .font(.custom("Lato", size: 13))
                            .border(Color(UIColor.separator))
                            .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)) : Color(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)))
                            .cornerRadius(6)
                        
                        SecureField("  Password", text: $loginVM.password)
                            .frame(height: 40)
                            .font(.custom("Lato", size: 13))
                            .border(Color(UIColor.separator))
                            .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)) : Color(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)))
                            .cornerRadius(6)
                            .padding(.top, 11)
                    }
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)) : Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)))
                    
                    Button("SIGN IN") {
                        loginVM.login()
                    }
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.9607843137, green: 0.8039215686, blue: 0.4745098039, alpha: 1)))
                    .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
                    .cornerRadius(6)
                    .font(.custom("Lato", size: 16))
                    .padding(.top, 11)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.top, 40)
            }
            .foregroundColor(Color(#colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)))
            .disableAutocorrection(true)
            .padding(.bottom, keyboardHandler.keyboardHeight - 55)
            .animation(.default)
            
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity)
        .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)) : Color(#colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(Color.white)
    }
    
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
