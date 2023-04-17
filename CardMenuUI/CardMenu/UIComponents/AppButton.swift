//
//  AppButton.swift
//  CardMenu
//
//  Created by Alberto Lourenço on 3/7/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

import SwiftUI

struct AppButton: View {
    
    var title: String = ""
    var onClick: () -> Void
    
    var body: some View {

        Button(action: {
            self.onClick()
        }) {
            Text(title)
                .modifier(ButtonModifier())
        }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(title: "") {
            
        }
    }
}
