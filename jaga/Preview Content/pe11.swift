//
//  pe11.swift
//  InterviewAiGame
//
//  Created by 이한규 on 2021/08/09.
//

import SwiftUI

struct pe11: View {
    struct Ocean: Identifiable {
        let name: String
        let id = UUID()
    }
    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]

    var body: some View {
        List(oceans) {
            Text($0.name)
        }
    }
}

struct pe11_Previews: PreviewProvider {
    static var previews: some View {
        pe11()
    }
}
