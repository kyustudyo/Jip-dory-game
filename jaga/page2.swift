//
//  page2.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct page2: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var bool_tmp : Bool = false
    @State var close : Bool = false
    @State var durationTime : Double = 6
    @State var delayTime : Double = 0
    @State var ment : Bool = false
    @State var volume : [Double] = [1,0]
   
    
    var specialCaseMent : String {
        //두가지모두 살리는 케이스 일때, 두가지 모두 정상작동하기 위한 코드.
        //두 질문지 모두 안전할때.
        //저 줄에하면 안된다. 오류뜸.
        if viewRouter.specialCaseIndex.contains(viewRouter.level){
            if viewRouter.yesOrNo == true {//이거 한줄만해도 되지않을까
                return viewRouter.unsafeReaction[viewRouter.level]
            }
            else {
                return viewRouter.safeReaction[viewRouter.level]
            }
        }
        else {
            return viewRouter.safeReaction[viewRouter.level]
        }
    }
    
    var second_image : String {
        
        if viewRouter.yesOrNo == true {//둘다살릴때
            return "\(viewRouter.level)"+"_1"
        }
        
        else {
            if UIImage(named: String(viewRouter.level) + "_2") != nil {
                return "\(viewRouter.level)"+"_2"
            }
            else {
                return "\(viewRouter.level)"
            }
        }
        
    }
    var third_image_existance : Bool {
        
        if viewRouter.yesOrNo == false{//일반적일때
            if UIImage(named: String(viewRouter.level) + "_3") != nil {
                return true
            }
            else {
                return false
            }
        }
        else {//
            if viewRouter.specialEffectMent[viewRouter.level] != "" {//둘다살릴때
            
                return true
            }
            else//할말없으면
            {
            return false
            }
        }
    }
    
    var body: some View {
        VStack{
            
//            if viewRouter.currentPage == "gameover"{
//                Text("gddgddgdg")}
            
            
           // else {
            (Image(second_image).resizable().ignoresSafeArea()
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
                                
                                                    .opacity(bool_tmp ? 1 : 0).animation(.easeOut(duration: 1.5))//첫번째 멘트 나오기
                                                    .onAppear{
                                                        self.bool_tmp = true
                                                        
                                                    }
                            
                            HStack(alignment:.lastTextBaseline){
                                Spacer()
                                (Button(action: {
                                    //Question.toggle()
                                    viewRouter.currentPage = "Ongame"
                                    viewRouter.level += 1
                                    //    num_tmp = 2
                                }, label: {
                                    Text(">>다음").foregroundColor(.red).bold().padding().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .opacity(ment ? volume[0] : volume[1] ).animation(.easeOut(duration: durationTime).delay(delayTime))
                                        
                                        .onAppear{
                                            if UIImage(named: String(viewRouter.level) + "_3") != nil{
                                                ment = false//추가사진있다면 버튼안틀어지도록.
//                                                durationTime = 4
//                                                delayTime = 1
//                                                volume[0] = 1
//                                                volume[1] = 0
                                            }
                                            else {
                                                ment = true
                                                durationTime = 1.5
                                                delayTime = 0
                                                volume[0] = 1
                                                volume[1] = 0
                                            }
                                            
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
                
            

        }.opacity(close ? 0 : 1).animation(.easeInOut(duration: 3).delay(3.7)).onAppear{
            if third_image_existance == true {//여분의 나올 사진이 있다면.
                close = true//이전에 것은 닫아라.
            }
        }.overlay(
            VStack{
                if close == true{//그리고 새로운사진 나오게하라 천천히.
                
                    //Image(String(viewRouter.level)+"_3")
                    additional_2page(viewRouter: viewRouter)
                    
                }
                
            }.opacity(close ? 1 : 0).animation(.easeOut(duration: 2.5).delay(2)).onAppear{//꺼억 전에
                if third_image_existance == true {
                    close = true
                }//새로운 창뜰때 애니메이션
            }//이 opacity 가 overlay에 걸려있으면 하얗게 나온다. 이거 버튼에도 적용해야겠다.

        )
    }
}

struct page2_Previews: PreviewProvider {
    static var previews: some View {
        page2(viewRouter: ViewRouter())
    }
}
