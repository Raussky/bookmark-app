//
//  Onboarding.swift
//  bookmarkApp
//
//  Created by Admin on 19.04.2023.
//

import SwiftUI

struct Onboarding: View {
    @Binding var screenState: AppScreenState
    var body: some View {
        NavigationView {
            welcome
        }

    }
    var welcome: some View {
        VStack{
            Image("welcome")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Text("Save all interesting links in one app")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 350)
                .padding(16)
                .padding(.bottom,0)
                .padding(.trailing,50)
            Button(action: {
                UserDefaults.standard.set(true, forKey: "isOnboardingSeen")
                    screenState = .main
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                    Text("Let's start collecting")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.custom("Welcome", size: 18))
                }
            }
            .frame(width: 350,height: 57)
            .padding(.bottom,20)
            .padding(.trailing,16)
        }
        .background(Color.black)
        .preferredColorScheme(.light)
    }
}



struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(screenState: .constant(.onboarding))
    }
}

