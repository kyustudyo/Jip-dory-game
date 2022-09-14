//
//  pr.swift
//  jaga
//
//  Created by 이한규 on 2021/07/26.
//




//onreceive
import SwiftUI
import Combine
struct ab: View {
    
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 10)
                        .repeatForever(autoreverses: false)
                )
                
        
        .onAppear {
            self.animationAmount = 2
        }
    }
    
}

struct pr_Previews: PreviewProvider {
    static var previews: some View {
        ab()
        
    }
}
