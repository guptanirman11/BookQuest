//
//  SplashScreen.swift
//  BookQuest
//
//  Created by Anshul Gupta on 09/03/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack{
            if self.isActive {
                //if the isActive bool is true then we launch content view
                ContentView()
            }else{
                // else we launch the splash screen
                VStack {
                    Spacer()
                    Text("Welcome to BookQuest")
                        .font(.custom("avenir", size: 24))
                        .bold()
                    Spacer()
                    Text("Nirman Gupta| cnetid: guptanirman11")
                        .font(.custom("avenir", size: 18))
                    Spacer()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.3))
                
            }
        }
        
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                withAnimation(){
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
