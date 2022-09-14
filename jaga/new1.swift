//
//  new1.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI
//원 작아졋다 커졋다.
struct new1: View {
    @State var scale: CGFloat = 1

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1).delay(1)//1초 씩 쉰다.
                let repeated = baseAnimation.repeatForever(autoreverses: true)

                withAnimation(repeated) {
                    scale = 0.5
                }
                
            }
            
            
    }
}

struct new1_Previews: PreviewProvider {
    static var previews: some View {
        new1()
    }
}
