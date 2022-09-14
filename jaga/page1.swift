//
//  page1.swift
//  jaga
//
//  Created by 이한규 on 2021/07/27.
//

import SwiftUI

struct page1: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var scale: CGFloat = 1
    //@Binding var Question : Bool//네 눌렀는가
    @State var num_tmp : CGFloat = 1
    @State var bool_tmp : Bool = false
    @State var game_over : Bool = false
    @State var a : CGFloat = 1
    @State var specialEffect = false
    @State var normalEffectOnMent = false
    @State var btnOn = false
    @State var volume : [Double] = [1,0]
    @State var durationTime : Double = 3
    @State var delayTime : Double = 2//6 -> 2
    var body: some View {
//        Button(action: {self.viewRouter.currentPage = "page2"}, label: {
//            Text("page2 으로 이동")
//        })
//        if self.viewRouter.currentPage == "gameover" {
//            gameover(viewRouter: viewRouter)
//        }
        
        VStack{
            
//            if viewRouter.currentPage == "gameover"{
//                Text("gddgddgdg")}
            
            
           // else {
            (Image(String(viewRouter.level)+"_1").resizable().ignoresSafeArea()
                //.opacity(Question ? 1 : 0).animation(.easeInOut(duration: 3))
                                
                
                
                .overlay(
                    
                    Rectangle().opacity(0.4).frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                )
            )
                //.opacity(Question ? 1 : 0).animation(.easeInOut(duration: 3))
                .scaleEffect(CGSize(width: num_tmp, height: 1.2))
                .animation(
                    Animation.easeOut(duration: bool_tmp ? 1.5 : 0)
                        .repeatForever(autoreverses: true)
                )
                .onAppear {
                    self.num_tmp = 1.1}
            .opacity(bool_tmp ? 1 : 0).animation(.easeOut(duration: 4))
            .onAppear{self.bool_tmp = true}//이미지 천천히 나오기.
            
            
            
            
            
            
                
//                .overlay( VStack{
//
//                    (Button("화면 터치") {
//                    num_tmp = 2
//                    self.a += 1
//                    //hidden = true
//                    })
//    //                .opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 5))).onAppear{self.bool_tmp = true}
//                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .background(Color.gray)
//                .foregroundColor(.white)
//                .opacity(0.3)
//                .clipShape(Circle())
//                .padding(30)
//
//                    .overlay(VStack(alignment:.center){
//                    Circle()
//                        .stroke(Color.gray)
//                        .scaleEffect(a)
//
//                        .opacity(Double(2 - a))
//                        .padding(30)
//                        .animation(
//                            Animation.easeOut(duration: 1.4)
//                                .repeatForever(autoreverses: true)
//
//                        )}
//                ).opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 5))//화면터치 느리게 켜지기.
//                .onAppear {
//                    self.a = 1.5
//                }
//            Spacer()
//                })//vstack 과 overlay
                
            
                .overlay( VStack{//vstack
//                            if viewRouter.currentPage == "page1"{//동작한다.
//                                Text("page1 입니다.")
//                            }
                
                    
                    
                    
                    Text(viewRouter.unsafeReaction[viewRouter.level])
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .font(.system(size: 25))
                        .opacity(specialEffect ? 0:1)
                        .animation(.easeInOut(duration: 4.8))//사라지는시간
                        
 //                       .opacity(normalEffectOnMent ? 1 : 0)
//                        .animation(.easeInOut(duration: 3)
                        
                        .onAppear{
                            if viewRouter.specialEffectIndex.contains(viewRouter.level) {
                                specialEffect = true
                            }
                            if !viewRouter.specialEffectIndex.contains(viewRouter.level){
                                                                normalEffectOnMent = true
                                                            }
                            
                        }
                        .overlay(Text(viewRouter.specialEffectMent[viewRouter.level])
                                    .bold()
                                    .frame(width: UIScreen.main.bounds.width, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                                                .foregroundColor(.white)
                                                .padding(10)
                                                .font(.system(size: 25))
                            .opacity(specialEffect ? 1:0)
                                    .animation(.easeInOut(duration: 5).delay(2))//만들어지는시간
                                    //확찐자가 ' 늦게나와서 줄였다.
//                                    .opacity(normalEffectOnMent ? 1:0)
//                                    .animation(.easeOut(duration:4))
                                    
                            .onAppear{
                                if viewRouter.specialEffectIndex.contains(viewRouter.level) {
                                    specialEffect = true
                                }
                                
//                                if !viewRouter.specialEffectIndex.contains(viewRouter.level){
//                                    normalEffectOnMent = true
//                                }
                                
                            }
                                 )
                                
                    
                    HStack(alignment:.lastTextBaseline){
                        Spacer()
                        
                        Button(action: {
                            //Question.toggle()
                            
                                //viewRouter.level = 0 // level 초기화//gameover로 옮김.
                            if (viewRouter.page1AfterEffectIndex .contains(viewRouter.level)){
                                viewRouter.currentPage = "page1AfterEffect"//끝내기전에 하나더 보여주고 싶을때.
                            }
                            else{
                                viewRouter.currentPage = "gameover"
                            }
                            
                            
                            
                            //    num_tmp = 2
                        }, label: {
                            Text(">>다음").foregroundColor(.red).bold().padding().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }.opacity(specialEffect ? volume[0] : volume[1]).animation(.easeOut(duration: durationTime).delay(delayTime))
                    .onAppear{
                        if viewRouter.specialEffectIndex.contains(viewRouter.level) {
                            specialEffect = true}
                        
                        if specialEffect != true {
                            volume[0] = 0
                            volume[1] = 1
                            delayTime = 0
                            durationTime = 3
                            
                        }
                        
                        
                    }
                }
//                .opacity(specialEffect ? 0:b).animation(.easeInOut(duration: 3).delay(5))
//                .onAppear{
//
//                }
                    
              //              .opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 3))
                )
            
            //.onAppear{self.bool_tmp = true}
            
            
            
                
            
//            .overlay(VStack{//버튼 되는곳.
//                Button(action: {
//                    //self.viewRouter.currentPage = "startpage"
//                    num_tmp = 2
//                }, label: {
//                    Text("Buttonfffdfdfdf")
//                })
//                Spacer()
//            }).opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 5))//버튼 되는곳.
//            .onAppear{self.bool_tmp = true}
            
            
//                .overlay(
//                    VStack{//버튼 할까 말까?
////                    (Button("화면 터치") {
////                    //self.a += 1
////                    //game_over = true
////                    //self.viewRouter.currentPage = "startpage"
////                    num_tmp = 2
////                    //hidden = true
////                    })
//                        Button(action: {num_tmp = 2}, label: {
//                            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                        })
//    //                .opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 5))).onAppear{self.bool_tmp = true}
//                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .background(Color.gray)
//                .foregroundColor(.white)
//                .opacity(0.3)
//                .clipShape(Circle())
//                .padding(30)
//
//                    .overlay(VStack(alignment:.center){
//                    Circle()
//                        .stroke(Color.gray)
//                        .scaleEffect(a)
//
//                        .opacity(Double(2 - a))
//                        .padding(30)
//                        .animation(
//                            Animation.easeOut(duration: 1.4)
//                                .repeatForever(autoreverses: true)
//                        )}
//                    ).opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 1))//화면터치 느리게 켜지기.
//                .onAppear {
//                    self.a = 2
//                }
//                Spacer()
//                }
//                )//vstack 과 overlay
//                //.opacity(bool_tmp ? 1 : 0).animation(.easeInOut(duration: 5))
//                //.opacity(self.viewRouter.currentPage == "startpage" ? 0 : 1)
            
            
            
            
            
            
           
//                .overlay(//overlay
//
//                        VStack{//vstack
//                        Text("         당신의 머리가 천장에 닿아,\n 천장을 통해 윗집이 감염되었습니다 .").foregroundColor(.white).padding(10).font(.system(size: 25))
//                            .scaleEffect(scale)
//
//                            .onAppear {
//
//                                let baseAnimation = Animation.easeInOut(duration: 1)
//                                let repeated = baseAnimation.repeatForever()
//
//
//                                withAnimation(repeated) {
//                                    scale = 0.9
//                                }
//
//                            }
//
//                            //.fixedSize(horizontal: false, vertical: true)
////                            .animation(
////                                Animation.easeOut(duration: 2)
////                                    .repeatForever(autoreverses: false))
//                    }//vstack
//
//
//
//                    )//overlay
                    
             
             
       //     }
        }
        
        //.overlay(VStack{//gameover
            
            //.opacity(game_over ? 1 : 0).animation(.easeInOut(duration: 10))
            
//            gameover()
//            .opacity(self.viewRouter.currentPage == "startpage" ? 1 : 0).animation(.easeInOut(duration: 3).delay(3))
            
            
            
                //.onAppear{self.bool_tmp = true
                    //self.bool_tmp = false
                //}
        //})
        
        

            
                
    
    }
    
}


struct page1_Previews: PreviewProvider {
    static var previews: some View {
        page1(viewRouter: ViewRouter())
    }
}
