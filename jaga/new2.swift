//
//  new2.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct new2: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
            }
        }
    }
}

struct new2_Previews: PreviewProvider {
    static var previews: some View {
        new2()
    }
}
