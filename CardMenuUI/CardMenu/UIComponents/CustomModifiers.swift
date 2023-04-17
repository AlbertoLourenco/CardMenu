//
//  CustomModifiers.swift
//  CardMenu
//
//  Created by Alberto Lourenço on 3/7/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct MenuModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .frame(width: (UIScreen.main.bounds.width / 3) * 2, height: 550)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Background-Secondary"), Color("Background-Primary")]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
    }
}

struct ButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .padding(20)
            .background(Color.white)
            .foregroundColor(Color.black.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 5, y: 5)
    }
}
