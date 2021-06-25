//
//  ViewModel.swift
//  2048
//
//  Created by Anvar Jumabaev on 08.06.21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var tiles = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
    ]
    
    init() {
        spown()
    }
    
    enum Actions{
        case left, right, up, down
    }
    
    func spown(){
        guard checkingGame() else { return }
        let randomNum = Int.random(in: 0...10)
        let randomRow = Int.random(in: 0...3)
        let randomColumn = Int.random(in: 0...3)
        
        if tiles[randomRow][randomColumn] == 0{
            tiles[randomRow][randomColumn] = randomNum == 9 ? 4 : 2//
        }else{
            spown()
        }
        
    }
    
    func leftGesture(){
        for row in 0..<tiles.count{
            for _ in 0..<tiles[row].count {
                if tiles[row][2] == 0{
                    tiles[row].remove(at: 2)
                    tiles[row].insert(0, at: 3)
                }
                
                if tiles[row][1] == 0{
                    tiles[row].remove(at: 1)
                    tiles[row].insert(0, at: 3)
                }
                
                if tiles[row][0] == 0{
                    tiles[row].remove(at: 0)
                    tiles[row].append(0)
                }
                if tiles[row][0] == tiles[row][1]{
                   tiles[row][0] *= 2
                    tiles[row].remove(at: 1)
                    tiles[row].append(0)
                    break
                }
                else if tiles[row][1] == tiles[row][2]{
                    tiles[row][1] *= 2
                    tiles[row].remove(at: 2)
                    tiles[row].append(0)
                    break
                }
                else if tiles[row][2] == tiles[row][3]{
                    tiles[row][2] *= 2
                    tiles[row].remove(at: 3)
                    tiles[row].append(0)
                    break
                }
                
            }
        }
        spown()
    }
    
    func rightGesture(){
        for row in 0..<tiles.count{
            for _ in 0..<tiles[row].count {
                if tiles[row][1] == 0{
                    tiles[row].remove(at: 1)
                    tiles[row].insert(0, at: 0)
                }
                
                if tiles[row][2] == 0{
                    tiles[row].remove(at: 2)
                    tiles[row].insert(0, at: 0)
                }
                
                if tiles[row][3] == 0{
                    tiles[row].remove(at: 3)
                    tiles[row].insert(0, at: 0)
                }
                if tiles[row][3] == tiles[row][2]{
                   tiles[row][3] *= 2
                    tiles[row].remove(at: 2)
                    tiles[row].insert(0, at: 0)
                    break
                }
                else if tiles[row][2] == tiles[row][1]{
                    tiles[row][2] *= 2
                    tiles[row].remove(at: 1)
                    tiles[row].insert(0, at: 0)
                    break
                }
                else if tiles[row][1] == tiles[row][0]{
                    tiles[row][1] *= 2
                    tiles[row].remove(at: 0)
                    tiles[row].insert(0, at: 0)
                    break
                }
                
            }
        }
        spown()
    }
    
    func upGesture(){
        for row in tiles.indices{
            for col in tiles[row].indices {
                
                if tiles[0][col] == tiles[1][col] || tiles[0][col] == tiles[1][col] && tiles[0][col] == tiles[2][col]{
                   tiles[0][col] *= 2
                    tiles[1][col] = 0
                }
                else if tiles[1][col] == tiles[2][col]{
                    tiles[1][col] *= 2
                    tiles[2][col] = 0
                }
                else if tiles[2][col] == tiles[3][col]{
                    tiles[2][col] *= 2
                    tiles[3][col] = 0
                }
                if tiles[0][col] == 0{
                    (tiles[0][col], tiles[1][col]) = (tiles[1][col], tiles[0][col])
                }
                if tiles[1][col] == 0{
                    (tiles[1][col], tiles[2][col]) = (tiles[2][col], tiles[1][col])
                }
                if tiles[2][col] == 0{
                    (tiles[2][col], tiles[3][col]) = (tiles[3][col], tiles[2][col])
                }
                
                
            }
        }
        spown()
    }
    
    func checkingGame() -> Bool{
        var check = 0
        for row in tiles.indices{
            for col in tiles[row].indices{
                if tiles[row][col] == 0{
                    check += 1
                }
            }
        }
        return check > 0
    }
}
