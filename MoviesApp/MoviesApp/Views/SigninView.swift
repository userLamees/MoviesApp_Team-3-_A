//
//  SigninView.swift
//  MoviesApp
//
//  Created by lamess on 24/12/2025.
//

import SwiftUI

struct SigninView: View {
    @State private var emailUser = ""
    @State private var pwUser = ""
    
    var body: some View {
        ZStack{

            Image("BackgroundSignin")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            LinearGradient(
                colors: [
                    Color.black.opacity(0.2),
                    Color.black.opacity(0.65),
                    Color.black.opacity(1)     ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8){
                Spacer()
                Text("Sign In")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(maxWidth: 350, alignment: .leading)
                Text("You'll find what you're looking for in the \n ocean of movies")
                    .font(.default)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 350, alignment: .leading)
             
                Text("Email")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.subheadline)
                
                
                    TextField("Enter your email ", text: $emailUser)
                        .foregroundStyle(Color.white)
                        .padding()
                        .background(Color.black.opacity(0.4).cornerRadius(10))
                        .frame(maxWidth: 350, alignment: .leading)
                
                
                TextField("Enter your password ", text: $pwUser)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black.opacity(0.4).cornerRadius(10))
                    .frame(maxWidth: 350, alignment: .leading)
                Button(action:{
                    
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.yellow)
                    .cornerRadius(10)})
                }
            
        }.padding(.horizontal, 24)
            .padding(.bottom, 40)
    }
}

#Preview {
    SigninView()
}
