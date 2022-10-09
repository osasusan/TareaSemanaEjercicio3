//
//  Game.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 9/10/22.
//

import Foundation
import UIKit

class Game:ProtocolGame{
    var imageUrl: String
    
    var game: String
    
    var company: String
    
    init(gameName : String, companyName : String, image : String){
        game = gameName
        company = companyName
        imageUrl = image
    }
    
    func getImageUrl() -> String {
        return imageUrl
    }
    
    func getTitle() -> String {
        return game
    }
    
    func getSubTitleCompany() -> String {
        return company
    }
    
    
    
    
    
    
}
