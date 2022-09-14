//
//  Ques.swift
//  jaga
//
//  Created by 이한규 on 2021/07/26.
//

import SwiftUI

struct Ques: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var yesOrNo: Bool = false
    //@Binding var Question : Bool
    
    
    var body: some View {
//        if viewRouter.currentPage == "gameover" {
//            gameover(viewRouter: viewRouter)
//        }
//        if viewRouter.currentPage == "startpage" {
//            StartView(viewRouter: viewRouter)
//        }
        //else {
        VStack(alignment: .leading){
            Rectangle().frame(  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).opacity(0)
                .overlay(
        HStack{
            (Rectangle()
                .foregroundColor(.black).frame( height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.3)
                .overlay(Rectangle().frame( height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.black).opacity(0), alignment: .bottom))
                
                .overlay(
                    VStack(spacing:0){
//                        if viewRouter.currentPage == "gameover"{
//                            Text("gddgddgdg")}
                        
                        Text(viewRouter.secondMent[viewRouter.level]).foregroundColor(.red).padding(10).font(.system(size: 25))
                        HStack{
                            Spacer()
                            Button(action: {
                                
                                if (viewRouter.yesEndIndex).contains(viewRouter.level) {//처음거 눌렀을 때 죽는케이스.
                                    self.viewRouter.currentPage = "page1"
                                }
                                else {
                                    self.viewRouter.currentPage = "page2"
                                }
                                
                                //self.Question = true
                            }, label: {
                                Text(self.viewRouter.questionType[self.viewRouter.level][0]).bold().padding(0).frame(height: 60, alignment: .center)
                                    .font(.system(size: 20)).foregroundColor(.white)
                            })
                            Spacer()
                            Button(action: {
                                
                                if !((viewRouter.yesEndIndex).contains(viewRouter.level)) {
                                    if ((viewRouter.specialCaseIndex).contains(viewRouter.level))
                                    {
                                        viewRouter.currentPage = "page2"
                                        viewRouter.yesOrNo = true
                                    }
                                    else{
                                        viewRouter.currentPage =  "page1"
                                    }
                                }
                                else {
                                    self.viewRouter.currentPage = "page2"
                                }
                                
                                //self.Question = false
                            }, label: {
                                Text(self.viewRouter.questionType[self.viewRouter.level][1]).bold().padding(0).frame(height: 60, alignment: .center).font(.system(size: 20)).foregroundColor(.white)
                            })
                            Spacer()
                        }
                    }
                   , alignment: .bottom)
        })
    }
        
//        .overlay( VStack{
//            if viewRouter.currentPage == "page1" {
//                //ofr()//귀엽다
//                page1(viewRouter: viewRouter)
//                    
//                
//                    //.opacity(Question ? 1 : 0)
//                //.animation(.easeInOut(duration: 10))
//                    
//            }
//            
//            else if viewRouter.currentPage == "page2" {
//                
//                page2(viewRouter: viewRouter)
////                    .opacity(self.viewRouter.currentPage == "page2" ? 1 : 0)
//            }
//        } , alignment: .top)
        
        
       // }
    }
}

struct Ques_Previews: PreviewProvider {
    static var previews: some View {
        Ques(viewRouter: ViewRouter())
    }
}
