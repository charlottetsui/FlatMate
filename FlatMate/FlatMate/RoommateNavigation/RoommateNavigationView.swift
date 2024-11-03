//
//  RoommateNavigationView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI


struct RoommateNavigationView: View {
    @Binding var flat: RoomieGroup
    @State private var showMessageView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<flat.roomies.count, id: \.self) { i in
                    RoommateBox(name: flat.roomies[i].name)
                }
                Button {
                    showMessageView = true
                } label: {
                    Text("Add new Member")
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 375)
                        .background(Color.primary)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
            }
        }
        .padding()
        .sheet(isPresented: $showMessageView) {
            MessageView(recipients: ["70423114777"], body: "A friend has invited you to join FlatMate, an app that allows you to conveniently manage and track group expenses!")
        }
    }
}
    //#Preview {
    //    RoommateNavigationView()
    //}
    
    

extension RoommateNavigationView {
    struct RoommateBox: View {
        let name: String
        var body: some View {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text(name)
                    .font(.headline)
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding()
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(15)
            .padding()
        }
    }
}
