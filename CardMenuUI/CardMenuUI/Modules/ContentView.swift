//
//  ContentView.swift
//  CardMenuUI
//
//  Created by Alberto Lourenço on 3/7/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMenu: Bool = false
    @State var dragState: CGSize = .zero
    
    var body: some View {
        
        ZStack {

            Color.black.edgesIgnoringSafeArea(.all) // window background
            
            ZStack {

                Color("Background-Primary")
                    .edgesIgnoringSafeArea(.all)
                
                AppButton(title: "Show Menu") {
                    self.showMenu.toggle()
                }
                .opacity(showMenu ? 0 : 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: showMenu ? 20 : 0))
            .scaleEffect(showMenu ? 0.8 : 1)
            .rotation3DEffect(Angle(degrees: showMenu ? 20 : 0), axis: (x: 0, y: -10, z: 0))
            .rotation3DEffect(Angle(degrees: Double(dragState.width) * 0.45), axis: (x: 0, y: -10, z: 0))
            .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView(showing: $showMenu, dragState: $dragState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
