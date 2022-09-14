//
//  ofr.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

enum AnimationState {
    case notAppeared, appeared, animating
}

struct ofr: View {
    @State private var animationState: AnimationState = .notAppeared
    private let delay: TimeInterval = 1

    var body: some View {
        Image(systemName: "paperplane.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
            .onAppear {
                
                withAnimation(.easeInOut(duration: delay)) {
                    animationState = .appeared
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(Animation.easeInOut.repeatForever()) {
                        animationState = .animating
                    }
                }
            }
    }

    private var imageSize: CGFloat {
        switch animationState {
        case .notAppeared: return 0
        case .appeared: return 50
        case .animating: return 40
        }
    }
}
struct ofr_Previews: PreviewProvider {
    static var previews: some View {
        ofr()
    }
}
