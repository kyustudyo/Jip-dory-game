//
//  StartView.swift
//  jaga
//
//  Created by 이한규 on 2021/07/26.
//

import SwiftUI
import Combine
import UIKit

struct StartView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var hidden = false
    //@State var timeCount = 0
    @State private var Question = false
    var body: some View {
        
        Button(action: {hidden = true}, label: {
            Image("light").resizable().ignoresSafeArea()
                
        })
        .overlay(VStack{
            (Rectangle().opacity(0.3).frame(width: .infinity, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(VStack{
                    Text("침대에서 일어나시겠습니까? ").foregroundColor(.white).padding(25).font(.system(size: 20))
                }
                
                )).opacity(Question ? 1 : 0)//괄호를 해야 잘 된다.
                .animation(.easeInOut(duration: 1.5))
                
        }
        )
//        .overlay(Circle()
//                    .opacity(hasError ? 1 : 0)
//                    .animation(
//                        Animation.linear
//                        .repeatCount(hasError ? Int.max : 0, autoreverses: true)))
        
        
        .overlay(VStack(alignment: .center){
            (
                Button("화면 터치") {
                self.animationAmount += 1
                hidden = true
            }
            .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.gray)
            .foregroundColor(.white)
            .opacity(0.3)
            .clipShape(Circle())
            .padding(30)
            
            .overlay(
                Circle()
                    .stroke(Color.gray)
                    .scaleEffect(animationAmount)
                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeOut(duration: 2)
                            .repeatForever(autoreverses: false)
                    )
            )
            .onAppear {
                self.animationAmount = 2
            }).opacity(hidden ? 0 : 1)
            
//
//            ((Text("Tap").bold().foregroundColor(.black).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).opacity( 0.4)).opacity(1).animation(Animation.linear.repeatCount(10))).opacity(hidden ? 0 : 1)
                
                
        }, alignment: .bottom)
        
        .overlay(
            
            
            VStack{
                
                
                Spacer()
                (Rectangle().opacity(0.3).frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).overlay(VStack{
                    
                    Text("\"??? : 오늘부터 10일간 자가격리다. 오늘하루 어떻게 지내지?\" ").foregroundColor(.white).padding(25).font(.system(size: 20))
                    
                    
                    
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
            .animation(.easeInOut(duration: 3))
            .opacity(Question ? 0 : 1).animation(.easeInOut(duration: 2))//질문하면 꺼지기.
        ).overlay(Button(action: {Question = true}, label: {
            Text("다음>>").padding().opacity(hidden ? 1 : 0).animation(.easeInOut(duration: 3)).opacity(Question ? 0 : 1).animation(.easeInOut(duration: 1.5))
        }), alignment: .bottomTrailing)
            
            
        
    }
    
//    func resetTimer() -> AnyPublisher<Date, Never> {
//        timeCount = timeCount + 1
//
//                guard flash else {
//                    return Empty<Date, Never>().eraseToAnyPublisher()
//                }
//               return Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
//                    .autoconnect()
//                    .eraseToAnyPublisher()
//
//            }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
