//
//  Ongame.swift
//  jaga
//
//  Created by 이한규 on 2021/07/29.
//

import SwiftUI

struct Ongame: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State private var animationAmount: CGFloat = 1
    @State private var hidden = false
    @State private var Question = false
    @State private var backgroundImage : Image = Image("1d")//아무거나
        
    
    var body: some View {
        
        (
            (
                backgroundImage.resizable().ignoresSafeArea()
                
        ).overlay(
            VStack(alignment: .center){
            (
                
                (Button("터치") {
                self.animationAmount += 1
                hidden = true
                })
                
            .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.gray)
            .foregroundColor(.white)
            .opacity(0.3)
            .clipShape(Circle())
            .padding(30)
            
                .overlay(VStack(alignment:.center){
                Circle()
                    .stroke(Color.gray)
                    .scaleEffect(animationAmount)
                    
                    .opacity(Double(2 - animationAmount))
                    .padding(30)
                    .animation(
                        Animation.easeOut(duration: 1.4)
                            .repeatForever(autoreverses: true)
                    )}
            )
            .onAppear {
                self.animationAmount = 1.5
                self.backgroundImage = Image(String(viewRouter.level))
                //백그라운드 이미지 설정. 질문할때 다른사진이 나오는경우가 있으므로 이렇게한다.
            }
                
            )
            .opacity(hidden ? 0 : 1)
                
                
                
            //.overlay(Rectangle().opacity(0.5))//0.9면 안눌리고
                //0.5 이러면 눌리네.. 결국 가리면 안눌리는거네..
                
                //
//            ((Text("Tap").bold().foregroundColor(.black).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).opacity( 0.4)).opacity(1).animation(Animation.linear.repeatCount(10))).opacity(hidden ? 0 : 1)
        }, alignment: .bottom)
        
        .overlay(
            VStack{
                
                Spacer()
                (Rectangle().opacity(0.3).frame( height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).overlay(VStack{
                    
                    Text(viewRouter.firstMent[viewRouter.level]).foregroundColor(.white).padding(25).font(.system(size: 25))
//                        .animation(
//                            Animation.easeOut(duration: 2)
//                                .repeatForever(autoreverses: false)
                }
                ))
                
//                .overlay(//overlay 한거에다가 overlay 한것.
//                    VStack{
//                        Spacer()
//                        HStack{
//                            Spacer()
//                            Button(action: { hidden = true}, label: {
//                                Text("다음>>")
//                            })
//                            .padding()
//                        }
//                    }
//                )
            }
            .opacity(hidden ? 1 : 0)
            .animation(.easeOut(duration: 1))
            
            .opacity(Question ? 0 : 1)
            .animation(.easeInOut(duration: 2))//질문하면 꺼지기.
        )
       
        .overlay(Button(action: {
            Question = true//첫번째 멘트에서 다음누르면.
            if UIImage(named: String(viewRouter.level) + "_q") != nil {
                backgroundImage = Image(String(viewRouter.level)+"_q")
                //질문할때 사용할 사진이 있는지 확인하고, 있으면 그사진을 사용한다.
            }
            
            //hidden = false
            

}, label: {
    Text("다음>>").padding().foregroundColor(.red).opacity(hidden ? 1 : 0).animation(.easeOut(duration: 1.5))//첫번째 대화창에서의 다음 켜질때
        .opacity(Question ? 0 : 1).animation(.easeInOut(duration: 1.5))//다음 꺼질때
}), alignment: .bottomTrailing)
        
        )
        
        
        .overlay(Ques(viewRouter: viewRouter).opacity(Question ? 1 : 0)
                
                                                .animation(.easeOut(duration: 1))//빨간색질문지
                
                
                
             //얘를 하면 page1의 애니메이션이 이상해진다.
        )//animation ease out을 opacity 보다 뒤에 써야한다.

    }
}

struct Ongame_Previews: PreviewProvider {
    static var previews: some View {
        Ongame(viewRouter: ViewRouter())
    }
}
