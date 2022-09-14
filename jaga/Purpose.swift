//
//  Purpose.swift
//  jaga
//
//  Created by 이한규 on 2021/07/24.
//

import SwiftUI

struct Purpose: View {
    //@ObservedObject var viewRouter: ViewRouter
    var body: some View {
        
        Image("mask").resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea()
            .overlay(
                HStack{
                
                Text("").bold().font(.system(size: 33)).foregroundColor(.red)
                }
                , alignment: .top)
            .overlay(VStack(alignment: .center, spacing: 13, content: {
                
                                VStack(alignment: .leading, spacing : 1){
                                    Text("기획자 임하림 : 자가격리 같은 생활 속 진정해보고 싶은 기획에 도전하기 위해서. ").bold().font(.system(size: 15)).frame(width: 135, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text("개발자 이한규 : 개발 실력을 키우기 위해서.").bold().font(.system(size: 15))
                
                
                }
            }))
    }
}

struct Purpose_Previews: PreviewProvider {
    static var previews: some View {
        Purpose()
    }
}
