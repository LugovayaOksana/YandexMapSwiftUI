//
//  BaseButton.swift
//  YandexMap
//
//  Created by Oksana on 23.05.2023.
//

import SwiftUI

import SwiftUI

struct BaseButton: View {
    var label: String
    let onClick: () -> Void
    
    init(
        label: String,
        onClick: @escaping () -> Void
    ) {
        self.label = label
        self.onClick = onClick
    }
    
    var body: some View {
        Button {
            self.onClick()
        } label: {
            Text(self.label)
                .font(.body)
        }
        .buttonStyle(
            BaseButtonStyle()
        )
    }
}
struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
        BaseButton(label: "", onClick: {})
    }
}
