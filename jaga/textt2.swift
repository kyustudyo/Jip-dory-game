//
//  textt2.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct textt2: View {
    @State var shortString = true
        var body: some View {
            VStack {
                if shortString {
                    Text("This is short.").font(.title).fixedSize()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration:2)))
                }
                if !shortString {
                    Text("This is considerably longer.").font(.title).fixedSize()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration:2)))
                }

                Button(action: {self.shortString.toggle()}) {
                    Text("Toggle").padding()
                }
            }
        }
}

struct textt2_Previews: PreviewProvider {
    static var previews: some View {
        textt2()
    }
}
