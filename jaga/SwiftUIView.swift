//
//  SwiftUIView.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct SwiftUIView: View {
    @State var animationAmount :CGFloat = 1
    @State var hidden : Bool = true
    var body: some View {
        VStack(alignment: .center){
        (
            (Circle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
                .background(Color.white)
                .opacity(0.3)
                
                .overlay(Button(action: {}, label: {
                    Text("Button")
                })))
                
//            (Button("화면 터치") {
//            self.animationAmount += 1
//            hidden = true
//            })
//        .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        .background(Color.gray)
//        .foregroundColor(.white)
//        .opacity(0.3)
//        .clipShape(Circle())
//        .padding(30)
        
            .overlay(VStack{
            Circle()
                .stroke(Color.gray)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                
                .animation(
                    Animation.easeOut(duration: 3)
                        .repeatForever(autoreverses: false)
                )}
        )
        .onAppear {
            self.animationAmount = 2
        }
        )
        .opacity(1)

        
    }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
