//
//  BaseButtonStyle.swift
//  YandexMap
//
//  Created by Oksana on 23.05.2023.
//

import SwiftUI

struct BaseButtonStyle: ButtonStyle {
    let screenWidth = UIScreen.main.bounds.width
    
    var cornerRadius: CGFloat = 4
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 14.0, leading: 7.0, bottom: 14.0, trailing: 7.0))
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.black)
            .background(configuration.isPressed ? Color.gray : Color.white)
            .cornerRadius(cornerRadius)
            .overlay (
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isEnabled ? Color.black : Color.gray, lineWidth: 1)
            )
    }
}
