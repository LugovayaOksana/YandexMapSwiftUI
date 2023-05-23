//
//  DialogView.swift
//  YandexMap
//
//  Created by Oksana on 23.05.2023.
//

import SwiftUI

struct DialogView: View {
    
    let onClick: () -> Void
    
    var body: some View {
        ZStack() {
            VStack(spacing: 20) {
                Text(StringManager.geolocationNotAllowed.toString())
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Text(StringManager.allowSettings.toString())
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                BaseButton(
                    label: StringManager.ok.toString(),
                    onClick: onClick
                )
            }
            .frame(maxWidth: .infinity)
            .padding(22)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomLeading)))
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
            .padding()
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(onClick: {})
    }
}
