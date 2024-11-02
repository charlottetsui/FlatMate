//
//  LandScreenView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct LandScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("LandScreenImage")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("Manage your shared expenses with ease.")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
                NavigationLink {
                    HomeScreenView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Continue")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    LandScreenView()
}
