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
                Image("Land Screen Image")
                Text("Manage your shared expenses with ease.")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                NavigationLink {
                    HomeScreenView()
                } label: {
                    Text("Continue")
                }

            }
        }
    }
}

#Preview {
    LandScreenView()
}
