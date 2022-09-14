//
//  twoani.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct twoani: View {
    @State private var isEnabled = false

    var body: some View {
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .background(isEnabled ? Color.green : Color.red)
        .animation(nil, value: isEnabled)
        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
        .animation(.default, value: isEnabled)
        //.animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        //Animation.easeIn(duration: 3)
        
    }
}

struct twoani_Previews: PreviewProvider {
    static var previews: some View {
        twoani()
    }
}
