//
//  ontap.swift
//  jaga
//
//  Created by 이한규 on 2021/07/29.
//

import SwiftUI

// onTapGesture

struct ontap: View {
    @State private var showImage = false
    
    var body: some View {
        VStack {
            if showImage {
                Image(systemName: "moon.stars.fill")
            }
            Text("onTapGesture").onTapGesture {
                self.showImage.toggle()
            }
        }
    }
}

struct ontap_Previews: PreviewProvider {
    static var previews: some View {
        ontap()
    }
}
