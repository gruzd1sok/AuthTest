//
//  ContentView.swift
//  AuthTest
//
//  Created by Илья Груздев on 10.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            if status {
                LogoutView()
            } else {
                AuthView()
            }
        }
        .animation(.spring())
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
    }
                    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
