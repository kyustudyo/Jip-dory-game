//
//  MyNameIs.swift
//  jaga
//
//  Created by 이한규 on 2021/07/24.
//

import SwiftUI

struct MyNameIs: View {
    var mine : WhoAreyou
    var image: Image {
        let printImage:Image
        if mine.name == "이한규"{ printImage = Image("lhk_2")}
        else {printImage = Image("lhl_2")}
        return printImage
    }
    var body: some View {
        image.resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .clipped()
            .overlay(
                
                VStack {
                    
                    VStack(alignment: .center, spacing : 12){
                        Spacer().frame(height:90)
                        Text(mine.name).bold().foregroundColor(.white).font(.system(size: 40))
                        Text(mine.email).bold().foregroundColor(.white).font(.system(size: 20))
                        Text(mine.talk).bold().foregroundColor(.white).font(.system(size: 20))
                        Text(mine.skill).bold().foregroundColor(.white).font(.system(size: 20))
                    }
                    
                    Spacer(minLength: 15)
                }, alignment: .center).ignoresSafeArea()
    }
}

struct MyNameIs_Previews: PreviewProvider {
    
    static var previews: some View {
        let me = WhoAreyou(name: "이한규", job : "개발자" ,email: "glolrylk@naver.com", talk: "ios 신입 개발자로 일하고 싶다.", skill: "정처기 자격증 보유")
        MyNameIs(mine: me)
    }
}
