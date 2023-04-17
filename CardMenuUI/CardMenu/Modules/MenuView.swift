//
//  MenuView.swift
//  CardMenu
//
//  Created by Alberto Lourenço on 3/7/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showing: Bool
    @Binding var dragState: CGSize
    
    var body: some View {
        
        ZStack {
            
            //  Background mask view
            
            Color.black
                .edgesIgnoringSafeArea(.all)
                .opacity(showing ? 0.3 : 0)
                .animation(.easeOut)
                .onTapGesture {
                    self.showing.toggle()
                }
            
            //  Card view
            
            VStack {

                VStack {
                    
                    VStack (spacing: 5) {
                        
                        Image("Avatar")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Text("Alberto Lourenço")
                            .fontWeight(Font.Weight.semibold)
                        
                        Text("@albertoLourenc")
                            .foregroundColor(Color.blue)
                            .font(Font.system(size: 14))
                    }
                    .frame(height: 250)
                    
                    Divider()
                        .padding(.bottom, 30)
                    
                    ScrollView {
                        
                        VStack (alignment: .leading, spacing: 60) {

                            HStack {
                                Image(systemName: "house")
                                Text("Home")
                            }
                            
                            HStack {
                                Image(systemName: "creditcard")
                                Text("Payments")
                            }
                            
                            HStack {
                                Image(systemName: "power")
                                Text("Logout")
                            }
                        }
                    }
                }
                .modifier(MenuModifier())
                .opacity(showing ? 1 : 0)
                .offset(x: showing ? 20 : -UIScreen.main.bounds.width)
                .offset(x: dragState.width)
                .rotation3DEffect(Angle(degrees: showing ? 0 : 85), axis: (x: 0, y: 10, z: 0))
                .rotation3DEffect(Angle(degrees: -Double(dragState.width)), axis: (x: 0, y: 10, z: 0))
                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.3))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            
                            if value.translation.width > 0 {
                                self.dragState.width = 0
                            }else if value.translation.width < -50 {
                                self.dragState.width = -50
                            }else{
                                self.dragState = value.translation
                            }
                        }
                        .onEnded{ value in

                            if self.dragState.width < -40 {
                                self.showing = false
                            }
                            self.dragState = .zero
                        }
                )
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .onAppear {
                self.dragState = .zero
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {

    static var previews: some View {

        MenuView(showing: .constant(true), dragState: .constant(.zero))
    }
}
