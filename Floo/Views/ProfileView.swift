//
//  ProfileView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image("turtlerock")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay {
                    ProfileOverlay()
                }
            
            VStack(alignment: .leading) {
                ZStack {
                    Color(.white)
                        .shadow(color: .black, radius: 20, x: 0, y: -20)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                    
                    VStack {
                        HStack {
                            Text("a")
                                .font(.title)
                        }

                        HStack {
                            Text("b")
                            Text("c")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Divider()

                        Text("About ")
                            .font(.title2)
                        Text("d")
                    }
                }

            }
            .offset(y: -20)
            .cornerRadius(20, corners: [.topLeft, .topRight])

        }
    }
}

struct ProfileOverlay: View {
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack {
            gradient
            VStack {
                Image("turtlerock")
                    .clipShape(Circle())
                    .shadow(radius: 7)
                
                Text("aaa")
                    .font(.title)
                    .bold()
                
                Text("aaa")
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
