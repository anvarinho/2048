//
//  ContentView.swift
//  2048
//
//  Created by Anvar Jumabaev on 08.06.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    // BUTTONS JUST TO CHECK GAME LOGIC:
                    // on final versions will be deleted
                    Button(action: {
                        vm.upGesture()
                    }, label: {
                        Text("Up")
                    })
                    
                    Button(action: {
                        vm.leftGesture()
                    }, label: {
                        Text("Left")
                    })
                    Button(action: {
                        vm.rightGesture()
                    }, label: {
                        Text("Right")
                    })
                }
                ZStack {
                   VStack {
                        
                        ForEach(vm.tiles, id: \.self){ column in
                            HStack{
                                ForEach(column, id: \.self){ item in
                                    TileView(number: item)
                                }
                            }
                        }
                    }
                }.padding(10)
                .background(Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)))
                .cornerRadius(15)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            
                            // SWIPE LEFT:
                            if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30{
                                vm.leftGesture()
                            }
                            // SWIPE RIGHT:
                            else if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30{
                                vm.rightGesture()
                            }
                            // SWIPE UP:
                            else if value.translation.height < 0 && value.translation.width < 30 && value.translation.width > -30{
                                vm.upGesture()
                            }
                            
                            //  PLACE FOR SWIPE DOWN:
                            // logic isn't completed    
                        })
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
