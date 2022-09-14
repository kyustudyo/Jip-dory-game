//
//  r.swift
//  jaga
//
//  Created by 이한규 on 2021/07/30.
//

import SwiftUI

struct additional_2page: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var bool_tmp : Bool = false
    @State var close : Bool = false
    @State var durationTime : Double = 3
    @State var delayTime : Double = 0
    @State var ment : Bool = false
    @State var volume : [Double] = [1,0]
    
    var specialCaseMent : String {
        //역시 두가지모두 살리는 케이스 일때, 두가지 모두 정상작동하기 위한 코드.
        //두 질문지 모두 안전할때.
        //저 다음줄로 하면
        if viewRouter.specialCaseIndex.contains(viewRouter.level){
            if viewRouter.yesOrNo == true{//이거 false 시켜놔야할듯.
                return viewRouter.specialEffectMent[viewRouter.level]
            }
            else {
                return viewRouter.additionalPage2Ment[viewRouter.level]
            }
        }
        else {
            return viewRouter.additionalPage2Ment[viewRouter.level]
        }
    }
    
    var backgroundImage : String {
        if viewRouter.yesOrNo == true {
            return (String(viewRouter.level) + "_4")//둘다 살리고 싶을때 _4 사진 있으면 멘트하나 추가 가능.
        }
        else {
            return String(viewRouter.level)+"_3"
        }
    }
    var body: some View {
        VStack{
            
//            if viewRouter.currentPage == "gameover"{
//                Text("gddgddgdg")}
            
            
           // else {
            (Image(backgroundImage).resizable().ignoresSafeArea()
            //(Image(String(viewRouter.level)).resizable().ignoresSafeArea()
            
                //.opacity(Question ? 1 : 0).animation(.easeInOut(duration: 3))
                                
                
                
                .overlay(
                    VStack{
                        Spacer()
                    Rectangle().opacity(0.4).frame( height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay( VStack{//vstack
        //                            if viewRouter.currentPage == "page1"{//동작한다.
        //                                Text("page1 입니다.")
        //                            }
                                    
           
                            Text(specialCaseMent)
                                                        .foregroundColor(.white)
                                                        .padding(10)
                                                        .font(.system(size: 25))
                                
                                                    .opacity(bool_tmp ? 1 : 0).animation(.easeOut(duration: 4).delay(0))//멘트
                                                    .onAppear{
                                                        self.bool_tmp = true
                                                    }
                            
                            HStack(alignment:.lastTextBaseline){
                                Spacer()
                                (Button(action: {
                                    //Question.toggle()
                                    if viewRouter.level == 8 {
                                        viewRouter.currentPage = "animation"//현재 마지막이 무조건 여기로 오게 돼어있다.
                                    }
                                    else {

                                    viewRouter.currentPage = "Ongame"
                                    viewRouter.level += 1
                                    viewRouter.yesOrNo = false//두가지모두 살리는거 초기화.
                                    //    num_tmp = 2
                                    }
                                }, label: {
                                    Text(">>다음").foregroundColor(.red).bold().padding().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .opacity(ment ? volume[0] : volume[1] ).animation(.easeOut(duration: durationTime).delay(delayTime))
                                        
                                        .onAppear{
                                            ment = true
                                            durationTime = 5
                                            delayTime = 1
                                            volume[0] = 1
                                            volume[1] = 0
                                            
                                        }
                                }))
                                
                                
                                
                            }
                        }
//                        .opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: durationTime).delay(delayTime))
//                        .onAppear{
//                            self.bool_tmp = true
//                        }

                        )
                    }
                )
            )
                
            

        }
       
    }
}


struct additional_2page_Previews: PreviewProvider {
    static var previews: some View {
        additional_2page(viewRouter: ViewRouter())
    }
}

