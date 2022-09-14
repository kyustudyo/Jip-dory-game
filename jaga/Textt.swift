//
//  Textt.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct Textt: View {
    @State var shortString = true
        var body: some View {
            VStack {
                Text(shortString ? "This is short." : "This is considerably longer.").font(.title)
                    .animation(.easeInOut(duration:1.0))
                Button(action: {self.shortString.toggle()}) {
                    Text("Toggle").padding()
                }
            }
        }}

struct Textt_Previews: PreviewProvider {
    static var previews: some View {
        Textt()
    }
}
