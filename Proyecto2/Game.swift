//
//  Game.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 9/10/22.
//

import Foundation
import UIKit

class Game: ProtocolGame{
   
   
  
    var game: String
    
    var company: String
    
    var description : String
    
    var gameGen = ""
    
    var imageUrl: String
    
    
    
    
    init(gameName : String, companyName : String, descripcion :String, gen : String , image : String){
        game = gameName
        company = companyName
        description = descripcion
        gameGen = gen
        imageUrl = image
       
    }
    
    func getImageUrl() -> String {
        return imageUrl
    }
    
    func getTitle() -> String {
        return game
    }
    
    func getDescription() -> String {
        return description
    }
    
   
   // func getgen() -> String {
   //     return gameGen[0]
   // }
   //
    func getSubTitleCompany() -> String {
        return company
    }

   
    
    
    
    
    
    
    
}
