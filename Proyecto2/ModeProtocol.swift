//
//  ModeProtocol.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 4/10/22.
//


import UIKit

class TableProrocol: UIViewController, UITableViewDelegate ,UITableViewDataSource{
   
    
    let url = URL(string: "https://picsum.photos/200/300&quot");
    let data = try? Data(contentsOf: url!)
    var imageView: UIImage = UIImage(data: data!)!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
