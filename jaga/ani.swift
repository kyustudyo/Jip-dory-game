//
//  ani.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct ani: View {
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                Text("Taylor Swift – 1989")
                    .font(.headline)
            } else {
                Text("Taylor Swift – 1989")
                    .font(.headline)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 44, height: 44)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

struct ani_Previews: PreviewProvider {
    static var previews: some View {
        ani()
    }
}
