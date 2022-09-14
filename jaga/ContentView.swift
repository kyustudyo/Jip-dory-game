//
//  ContentView.swift
//  jaga
//
//  Created by 이한규 on 2021/07/23.
//

import SwiftUI
import Foundation
import Combine
import SwiftUI
import AVFoundation



struct ContentView: View {
    @State var Start = false
    @State var a = false
    @State var slow = false
    @State var slow2 = false
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        NavigationView {
            VStack{
                if viewRouter.currentPage == "startpage"{
                    StartView(viewRouter: viewRouter)//viewrouter() 이거라하면안된다.
                }
                else if viewRouter.currentPage == "mainpage" {

                Image("mask").resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .clipped()
                    .overlay(
                        
                        VStack(alignment: .center){
                            
                            Text("집돌이 게임")
                                .fontWeight(.heavy)
                                .font(.system(size: 45))
                                .kerning(2)
                                .shadow(color: Color.gray, radius: 3, x: 15, y: 20)//그림자
                                
                                
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                                .padding(20)
                        
                            

                            
                            Button(action: {
                                
                                self.viewRouter.currentPage = "startpage"
                                //self.viewRouter.currentPage = "animation"
                                
                            }, label: {
                                Text("Start !!")
                                    .bold()
                                    .foregroundColor(.red)
                                    .font(.title)
                                    .background(
                                        Color.white.opacity(0.6)
                                    )
                            })
                            NavigationLink(
                                destination: Quiz(viewRouter: viewRouter),
                                label: {
                                    HStack{
                                                                        Spacer()
                                                                        Image("jaga").resizable()
                                                                            .frame(width: 30, height: 30, alignment: .center)
                                                                            .clipShape(Circle())
                                    
                                    
                                                                        Text("집돌순 테스트").bold()
                                                                            .foregroundColor(.blue)
                                                                        Spacer()
                                                                    }
                                })
                            
                            
                            NavigationLink(
                                destination: WhoMade(),
                                label: {
                                    HStack{
                                                                        Spacer()
                                                                        Image("jaga").resizable()
                                                                            .frame(width: 30, height: 30, alignment: .center)
                                                                            .clipShape(Circle())
                                    
                                    
                                                                        Text("만든 이").bold()
                                                                            .foregroundColor(.blue)
                                                                        Spacer()
                                                                    }
                                })
//                            NavigationLink(
//                                destination: Purpose(),
//                                label: {
//                                    HStack{
//                                                                        Spacer()
//                                                                        Image("jaga").resizable()
//                                                                            .frame(width: 30, height: 30, alignment: .center)
//                                                                            .clipShape(Circle())
//                                    
//                                    
//                                                                        Text("왜 만듦?").bold()
//                                                                            .foregroundColor(.blue)
//                                                                        Spacer()
//                                                                    }
//                                })
//                            Button(action: {viewRouter.currentPage = "whomade"}, label: {
//                                HStack{
//                                    Spacer()
//                                    Image("jaga").resizable()
//                                        .frame(width: 30, height: 30, alignment: .center)
//                                        .clipShape(Circle())
//
//
//                                    Text("만든 이").bold()
//                                        .foregroundColor(.blue)
//                                    Spacer()
//                                }
//                            })
                            
                            //.navigationTitle("")
                            
                            
                            
//                            Button(action: {viewRouter.currentPage = "purpose"}, label: {
//                                HStack{
//                                    Image("jaga").resizable()
//                                        .frame(width: 30, height: 30, alignment: .center)
//                                        .clipShape(Circle())
//                                    Text("이 게임 뭐임?").bold()
//                                        .foregroundColor(.blue)
//                                }
//                            })
                         
                            
                        }
                    )
                
                }
                else if viewRouter.currentPage == "page1" {
                    page1(viewRouter: viewRouter)
                }
//                else if viewRouter.currentPage == "purpose" {
//                    Purpose(viewRouter: viewRouter)
//                }
//                else if viewRouter.currentPage == "whomade" {
//                    WhoMade()
//                }
                else if viewRouter.currentPage == "page1AfterEffect" {
                    Page1AfterEffect(viewRouter: viewRouter)
                }
                else if viewRouter.currentPage == "animation" {
                    Lastanimation(viewRouter: viewRouter)
                }
                
                else if viewRouter.currentPage == "page2" {
                    page2(viewRouter: viewRouter)
                        .opacity(slow2 ? 1 : 0).animation(.easeOut(duration: 3))
                        .onAppear{
                            slow2 = true
                        }
                        .onDisappear{
                            slow2 = false
                        }
                    
                }
                
                else if self.viewRouter.currentPage == "gameover"{
                    gameover(viewRouter: viewRouter)
                        .opacity(viewRouter.over ? 1 : 0).animation(.easeOut(duration: 2))
                                        .onAppear{
                                            viewRouter.over = true
                                        }
                }
                else {
                    Ongame(viewRouter: viewRouter)
                }
         
            }.ignoresSafeArea()
        
    }.navigationViewStyle(StackNavigationViewStyle())
        
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
