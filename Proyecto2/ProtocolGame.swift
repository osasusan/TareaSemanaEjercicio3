//
//  ProtocolGame.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 9/10/22.
//

import Foundation
import UIKit
protocol ProtocolGame{
    
    var imageUrl: String { get set}
    var game: String { get set}
    var company: String { get set}
   // var gameGen : [String] {get set }
    var description :String {get set}

    
    
    func getImageUrl() -> String
    func getTitle() -> String
    func getSubTitleCompany() -> String
    func getDescription ()-> String
  //  func getgen()-> String
    
  
}
