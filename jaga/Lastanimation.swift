//
//  animation.swift
//  jaga
//
//  Created by 이한규 on 2021/08/02.
//

import SwiftUI

struct Lastanimation: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var a:Bool = false
    @State var b:Bool = false
    @State var c:Bool = false
    var body: some View {
        VStack{
            (Image("time1").resizable().ignoresSafeArea().opacity(a ? 0 : 1).animation(.easeInOut(duration: 2).delay(2)).onAppear{
                a = true
            }).overlay(
                Image("time2").resizable().ignoresSafeArea().opacity(b ? 1 : 0).animation(.easeOut(duration: 3).delay(2)).onAppear{
                    b = true
                }.overlay(
                    VStack{
                        Spacer()
                        (Rectangle().opacity(0.4).frame( height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                            .opacity(b ? 1 : 0).animation(.easeOut(duration: 3).delay(2)).onAppear{
                            b = true
                        })
                            .overlay(Text("방학 1일차 성공").bold().shadow(radius: 3)
                                        .opacity(c ? 1 : 0).animation(.easeOut(duration: 4).delay(3)).onAppear{
                                c = true
                            }).foregroundColor(.black).font(.system(size: 40))
                            
                            
                        Spacer()
                        
                    }
                    .overlay(VStack(spacing:15){
                        Spacer()
                        Button(action: {
                            viewRouter.level = 0
                            viewRouter.currentPage = "startpage"
                            viewRouter.over = false// 두 번째 gameover 뜰때에도 2초 애니메이션 주기위해.contentview
                        }, label: {
                            Text(">> 처음부터 다시하기").foregroundColor(.white)
                        })
                        Text("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ").foregroundColor(.white)
//                        NavigationLink(
//                            destination: Purpose(),
//                            label: {
//                                Text("이 게임 뭐임?").foregroundColor(.white).padding(.bottom, 40)
//                        })
                        Button(action: {
                                viewRouter.over = false
                                viewRouter.level = 0
                                viewRouter.currentPage = "mainpage" }, label: {
                            Text(">> 메인 으로").foregroundColor(.white)
                        })
                            
                    }.opacity(c ? 1 : 0).animation(.easeOut(duration: 4).delay(3)).onAppear{
                        c = true
                    }, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                )
                
            )
            
                
        }
    }
}

struct Lastanimation_Previews: PreviewProvider {
    static var previews: some View {
        Lastanimation(viewRouter: ViewRouter())
    }
}
