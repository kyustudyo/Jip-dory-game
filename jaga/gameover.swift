//
//  gameover.swift
//  jaga
//
//  Created by 이한규 on 2021/07/28.
//

import SwiftUI

struct gameover: View {
    
    @State var restart = false
    @State var purpose = false
    @ObservedObject var viewRouter: ViewRouter
    var backgroundImage : String {
        
        if viewRouter.page1AfterEffectIndex.contains(viewRouter.level) {
            return (String(viewRouter.level) + "_page1specialeffect")
        }
        else {
            return (String(viewRouter.level) + "_1")
        }
    }
    var body: some View {
//        if restart {
//            StartView(viewRouter: viewRouter)
//        }
        
            Image(backgroundImage).resizable().ignoresSafeArea().opacity(1)
                .overlay((Image("gameover").resizable().ignoresSafeArea().opacity(0.5)
                            .overlay(VStack{
                                Rectangle().frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding().opacity(0.5)
                                    .overlay(VStack(spacing:15){
                                        Button(action: {
                                            viewRouter.level = 0
                                            viewRouter.currentPage = "startpage"
                                            viewRouter.over = false// 두 번째 gameover 뜰때에도 2초 애니메이션 주기위해.contentview
                                        }, label: {
                                            Text(">> 처음부터 다시하기").foregroundColor(.white)
                                        })
                                        Text("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ").foregroundColor(.white)
                                        
                                        Button(action: {viewRouter.currentPage = "mainpage"
                                            viewRouter.level = 0
                                        }, label: {
                                            Text(">> 메인 으로").foregroundColor(.white)
                                        })
                                    }, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }, alignment: .bottom)
                        
                    ))
        

//        (Image("gameover").resizable().ignoresSafeArea()
//            .overlay(VStack{
//                Rectangle().frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).opacity(0.5)
//                    .overlay(VStack(spacing:15){
//                        Button(action: {
//                            viewRouter.currentPage = "startpage"
//                            viewRouter.over = false// 두 번째 gameover 뜰때에도 2초 애니메이션 주기위해.
//                        }, label: {
//                            Text(">> 처음부터 다시하기").foregroundColor(.white)
//                        })
//                        Text("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ").foregroundColor(.white)
//                        NavigationLink(
//                            destination: Purpose(),
//                            label: {
//                                Text("이 게임 뭐임?").foregroundColor(.white)
//                            })
//                    }, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            }, alignment: .bottom)
//
//    )
//            .overlay(StartView(viewRouter: ViewRouter()).opacity(restart ? 1 : 0), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct gameover_Previews: PreviewProvider {
    static var previews: some View {
        gameover(viewRouter: ViewRouter())
    }
}
