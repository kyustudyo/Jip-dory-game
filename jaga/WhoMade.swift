//
//  WhoMade.swift
//  jaga
//
//  Created by 이한규 on 2021/07/24.
//

import SwiftUI

struct WhoAreyou: Identifiable {
    var id = UUID()
    var name : String
    var job : String
    var email : String
    var talk : String
    var skill : String
    
}
struct WhoMade: View {
    var weAre:[WhoAreyou] {
        var we:[WhoAreyou] = []
        we.append(lhl)
        we.append(lhk)
        //we.append(prz)
        return we
    }
    
    let lhk = WhoAreyou(name: "이한규", job: "개발자",email: "glorylk@naver.com", talk: "", skill: "정보처리기사 자격증 보유")
    let lhl = WhoAreyou(name: "임하림", job: "기획자",email: "hahahoho_13@naver.com", talk: "", skill: "전기기사 자격증 보유")
//    let prz = WhoAreyou(name: "Prisma App", job: "photos are preocessed in", email: "", talk: "", skill: "")
    var body: some View {
        
            
            //화면 크기 알아내기
        Image("mask").resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    
                    ForEach(weAre) { kk in
                        //Spacer().frame(height: 10)
                        NavigationLink(
                            destination: MyNameIs(mine: kk),
                            label: {
                                Image("\(kk.name)").resizable().frame(width: 60, height: 60).cornerRadius(10)
                                Text("\(kk.job)").bold().font(.system(size: 30))
                                
                                Text("\(kk.name)").bold().font(.system(size: 30))
                            })
                        
                            
                    }
                    Text("* Photos in this app have been  \n  processed in Prisma App.")
                        .foregroundColor(.black)
                    Spacer().frame(height:100)
                    }
            )
            
        
        
        
    }
                
    //            HStack {
    //                Image("LHL").resizable().frame(width: 50, height: 50).cornerRadius(10)
    //                Text("기획자 임하림").bold()
    //        }
    //
    //            HStack{
    //                Image("LHK").resizable().frame(width: 50, height: 50).cornerRadius(10)
    //                Text("개발자 이한규").bold()
    //        }
                
                
            
            
            
     
}

struct WhoMade_Previews: PreviewProvider {
    static var previews: some View {
        WhoMade()
    }
}
