//
//  viewclose.swift
//  jaga
//
//  Created by 이한규 on 2021/07/28.
//

import SwiftUI
struct DismissingView1: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Dismiss Me") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct viewclose: View {
    @State private var showingDetail = false

    var body: some View {
        Button("Show Detail") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView1()
        }
    }
}


struct viewclose_Previews: PreviewProvider {
    static var previews: some View {
        viewclose()
    }
}
