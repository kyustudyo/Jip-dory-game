//
//  viewclose2.swift
//  jaga
//
//  Created by 이한규 on 2021/07/28.
//

import SwiftUI

struct DismissingView2: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss Me") {
            isPresented = false
        }
    }
}

struct viewclose2: View {
    @State private var showingDetail = false

    var body: some View {
        Button("Show Detail") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView2(isPresented: $showingDetail)
        }
    }
}



struct viewclose2_Previews: PreviewProvider {
    static var previews: some View {
        viewclose2()
    }
}
