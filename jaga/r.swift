//
//  r.swift
//  jaga
//
//  Created by 이한규 on 2021/07/30.
//

import SwiftUI

struct r: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var bool_tmp : Bool = false
    @State var close : Bool = false
    @State var durationTime : Double = 3
    @State var delayTime : Double = 0
    @State var ment : Bool = false
    @State var volume : [Double] = [1,0]
    
    var body: some View {
        VStack{
            
//            if viewRouter.currentPage == "gameover"{
//                Text("gddgddgdg")}
            
            
           // else {
            (Image(String(viewRouter.level)+"_3").resizable().ignoresSafeArea()
            //(Image(String(viewRouter.level)).resizable().ignoresSafeArea()
            
                //.opacity(Question ? 1 : 0).animation(.easeInOut(duration: 3))
                                
                
                
                .overlay(
                    VStack{
                        Spacer()
                    Rectangle().opacity(0.4).frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay( VStack{//vstack
        //                            if viewRouter.currentPage == "page1"{//동작한다.
        //                                Text("page1 입니다.")
        //                            }
                                    
                                    
                            Text(viewRouter.additionalPage2Ment[viewRouter.level])
                                                        .foregroundColor(.white)
                                                        .padding(10)
                                                        .font(.system(size: 25))
                                
                                                    .opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 3).delay(0))//멘트
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
                                        .opacity(ment ? volume[0] : volume[1] ).animation(.easeInOut(duration: durationTime).delay(delayTime))
                                        
                                        .onAppear{
                                            ment = true
                                            durationTime = 4
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


struct r_Previews: PreviewProvider {
    static var previews: some View {
        r(viewRouter: ViewRouter())
    }
}
