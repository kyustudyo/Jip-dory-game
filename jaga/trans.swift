//
//  trans.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct trans: View {
    @State var transitionView: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack{
                Button("버튼") {
                    transitionView.toggle()
                }
                Spacer()
            }
        
            if transitionView {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .transition(AnyTransition.opacity.animation(.easeInOut))
                .opacity(0.3)
//                .animation(.easeIn)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct trans_Previews: PreviewProvider {
    static var previews: some View {
        trans()
    }
}
