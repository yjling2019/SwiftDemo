//
//  FavoriteButton.swift
//  SwiftUITest
//
//  Created by 凌永剑 on 2022/1/24.
//

import SwiftUI

struct FavoriteButton: View {
	//属性装饰器，swift是值类型，通过Binding修饰之后变成引用类型
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
