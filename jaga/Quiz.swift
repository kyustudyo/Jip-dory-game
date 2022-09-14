//
//  Purpose.swift
//  jaga
//
//  Created by 이한규 on 2021/07/24.
//

import SwiftUI

struct Quiz: View {
    //@ObservedObject var viewRouter: ViewRouter
    var answerColumns : [GridItem]{ Array(repeating: GridItem(.fixed(20),spacing:0), count: 10)
    }
    @ObservedObject var viewRouter: ViewRouter
    @State var isPressedO = false
    @State var isPressedX = false
    @State var result = 0
    @State var complete = Array(repeating: 0, count: ViewRouter().quiz.count)
    @State var printResultBtn = false
    var ment : String {
        switch (complete.reduce(0,+)) {
        case 15 : return "집에 보물 숨겨두셨나요?"
            case  11...14 : return "비타민 D 결핍 의심됩니다. 병원에 내원하세요.."
        case  8...10 : return "직업으로 개발자 추천드립니다!"
        case  5...7 : return "프로 방콕러!"
        case 0...4: return "방콕러!"
        case  -5...(-1): return "세미 방콕러!"
        case  -8...(-5): return "일반(general)인"
        case -14...(-9) : return "삑- 방콕러가 아니십니다."
        case -15 : return "밖에 보물 숨겨 두셨나요..?"
        default : return "unKnown"
        }
    }
    var body: some View {
        
        Image("").resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea()
            
            .overlay(
                VStack{
                    Text("집돌순 Test").bold().font(.system(size: 35))
                    
                ScrollView {
                    VStack{
//                        List{
//                                                                ForEach(complete, id: \.self){ n in
//                                                                    Text("\(n)")
//                                                                }
//                                                            }.frame(width: 100, height: 300)
                        
                        ForEach(0..<viewRouter.quiz.count) { index in
                            
                        HStack{
                            Text(viewRouter.quiz[index]).bold().font(.system(size: 15)).frame(width: 250, height: 50, alignment:  .center)
                                .multilineTextAlignment(.center)
                                Button(action: {
                                    printResultBtn = false
                                    if complete[index] != 1 {
                                        complete[index] = 1
                                        //result += 1
                                    }
                                    print(complete[index])
                                    print("total:\(complete.reduce(0){$0+$1})")
                                
                                    
                                    isPressedO = true
                                    isPressedX = false
                                    
                        
                                            print("Round Button Tapped")
                        
                                }
                                        ) {
                        
                                            Text("O")
                                                .padding()
                                                .background(
                                                    Circle()
                                                    
                                                        .fill(complete[index] == 1 ?  Color.gray : Color.black)
                                                        
                                                            
                        
                        
                                            )
                                                .foregroundColor(Color.orange)
                        
                                }
                                Button(action: {
                                    printResultBtn = false
                                    if complete[index] != -1 {
                                        complete[index] = -1
                                        //result -= 1
                                    }
                                    print(complete[index])
                                    print("total:\(complete.reduce(0){$0+$1})")
                                    
                        
                                    
                                    isPressedX = true
                                    isPressedO = false
                                            print("Round Button Tapped")
                        
                                        }
                                        ) {
                        
                                            Text("X")
                                                .padding()
                                                .background(
                                                    Circle()
                                                        .fill(complete[index] == -1 ?  Color.gray : Color.black)
                        
                        
                                            )
                                                .foregroundColor(Color.orange)
                        
                                        }
//                                .onChange(of: isPressed) { newValue in
//
//                                }
                        
                            }
                    }
                        
                    
                    
                                
                    }
            }
                    HStack{
                        
                        Text("집돌순 score: \(complete.reduce(0,+))").padding(.bottom,10)
                            .padding(.leading,10)
                        Spacer()
                        Button {
                            printResultBtn = true
                            print("")
                        } label: {
                            Text("결과확인").padding(.trailing,10).padding(.bottom,10)
                        }

                    }
                    
                    
                    Text(ment)
                        
                        .font(.largeTitle)
                            .padding(5)
                            .border(Color.black)
                            .opacity(printResultBtn == true ? 1 : 0)
                    Spacer().frame(height:50)
                }
                
                
                
            )
    }
}

struct Purpose_Pdreviews: PreviewProvider {
    static var previews: some View {
        Quiz(viewRouter: ViewRouter())
    }
}
//VStack(alignment: .leading, spacing : 20){
//
//    HStack{
//        Text("1. 나에겐 슈퍼가는 것도 스케쥴이다. ").bold().font(.system(size: 15)).frame(width: 250, height: 20, alignment:  .center)
//        Button(action: {
//
//                    print("Round Button Tapped")
//
//                }
//                ) {
//
//                    Text("O")
//                        .padding()
//                        .background(
//                            Circle()
//                                .fill(Color.black)
//
//
//                    )
//                        .foregroundColor(Color.orange)
//
//                }
//        Button(action: {
//
//                    print("Round Button Tapped")
//
//                }
//                ) {
//
//                    Text("X")
//                        .padding()
//                        .background(
//                            Circle()
//                                .fill(Color.black)
//
//
//                    )
//                        .foregroundColor(Color.orange)
//
//                }
//
//    }
//
//
//
//
//
//
//}
