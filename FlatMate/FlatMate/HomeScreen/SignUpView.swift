//
//  SignUpView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/3/24.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var isSignedUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                TextField("Name", text: $name)
                    .padding()
                    .frame(width: 375, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                    .padding()
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 375, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                    .padding()
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 375, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                    .padding()
                Button {
                    isSignedUp = true
                } label: {
                    Text("Continue")
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 375)
                        .background(Color.primary)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                    
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $isSignedUp) {
                MainView().navigationBarBackButtonHidden(true)
            }
        }
    }
}

//#Preview {
//    SignUpView()
//}
