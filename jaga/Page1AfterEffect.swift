//
//  Page1AfterEffect.swift
//  jaga
//
//  Created by 이한규 on 2021/08/02.
//

import SwiftUI

struct Page1AfterEffect: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var start: Bool = false
    
    var backgroundImage : String {
        
        if UIImage(named: String(viewRouter.level) + "_page1specialeffect") != nil {//사진있으면
            return (String(viewRouter.level) + "_page1specialeffect")//있는거 쓰고
        }
        else {
            return (String(viewRouter.level) + "_1")//없으면 이전것 써라.
        }
    }
    
    var body: some View {
        VStack{
            
            (Image(String(viewRouter.level)+"_page1specialeffect").resizable().ignoresSafeArea()
                
                                
                .overlay(
                    
                    Rectangle().opacity(0.4).frame( height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
         
                )
                .overlay(VStack{
                    Text(viewRouter.page1AfterEffectMent[viewRouter.level]).foregroundColor(.white)
                        .padding(10)
                        .font(.system(size: 25))
                
                    HStack(alignment:.lastTextBaseline){
                        Spacer()
                        
                        Button(action: {
                                viewRouter.currentPage = "gameover"

                        }, label: {
                            Text(">>다음").foregroundColor(.red).bold().padding().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        
                }
                }
                )
             
            )
        }.opacity(start ? 1 : 0).animation(.easeOut(duration: 3)).onAppear{
            start = true
        }
        
    }
}

struct Page1AfterEffect_Previews: PreviewProvider {
    static var previews: some View {
        Page1AfterEffect(viewRouter: ViewRouter())
    }
}
