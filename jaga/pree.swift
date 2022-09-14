//
//  pree.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct TransitionView: View {
    @State private var isTabbed = false
    
    var body: some View {
        VStack {
            Spacer()
            if isTabbed {
                Text("Goodbye, world!")
                    .modifier(StandarTitle())
                    .padding()
                    .transition(AnyTransition.opacity.animation(.easeInOut).combined(with: AnyTransition.slide))
                    .animation(.easeInOut)
            } else {
                Text("Hello, world!")
                    .modifier(StandarTitle())
                    .padding()
                    .transition(AnyTransition.opacity.animation(.easeInOut).combined(with: AnyTransition.slide))
                    .animation(.easeInOut)
            }
            
            Spacer()
            ZStack {
                Text("Hello, world!")
                    .modifier(StandarTitle())
                    .opacity(isTabbed ? 0 : 1)
                    .animation(.easeInOut)
                    .rotationEffect(.degrees(isTabbed ? 360 : 0))
                Text("Goodbye, world!")
                    .modifier(StandarTitle())
                    .opacity(isTabbed ? 1 : 0)
                    .animation(.easeInOut)
                    .rotationEffect(.degrees(isTabbed ? 360 : 0))
            }
            Spacer()
            if isTabbed {
                Text("Goodbye, world!")
                    .modifier(StandarTitle())
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity))
            } else {
                Text("Hello, world!")
                    .modifier(StandarTitle())
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity))
            }
            Spacer()
        }
        .animation(.easeInOut(duration: 1))
        .onTapGesture {
            self.isTabbed.toggle()
        }
    }
}

struct StandarTitle: ViewModifier {
    let font = Font.system(size: 32, weight: .heavy)
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding()
    }
}

struct pree_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
