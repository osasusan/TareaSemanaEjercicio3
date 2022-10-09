//
//  games.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 5/10/22.
//

protocol gameProtocol {
        
    var imageUrl: String { get set}
    var title: String { get set}
    var enterprise: String { get set}
    
    // Getters
    func getImageUrl() -> String
    func getTitle() -> String
    func getEnterprise() -> String
    
    // Setters
    func setImageUrl(url: String)
    func setTitle(title: String)
    func setEnterprisee(enterprise: String)
        
        
}


