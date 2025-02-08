//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 4.02.2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading , spacing: 32){
            VStack(alignment: .leading, spacing : 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Log in to start planning your next trip")
                
                
                
                LogInButton()
                    .padding(.vertical)
                
                
                
                HStack{
                    Text("Don't have a account?")
                    
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.footnote)
            }
            
          
            
            VStack(spacing : 24){
                ProfileOptionRowView(sytemName: "gear", title: "Settings")
                ProfileOptionRowView(sytemName: "accessibility", title: "Accessibility")
                ProfileOptionRowView(sytemName: "questionmark.circle", title: "Visit to help center")
            }
        }.padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
