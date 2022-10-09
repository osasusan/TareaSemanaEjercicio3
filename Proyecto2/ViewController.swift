//
//  ViewController.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 4/10/22.
//

import UIKit

class VcMain: UITableViewController{
    
   

    
    var game = [Game(gameName: "Suicide Season", gameCompany: "Bring me the Horizon",gameImageUrl: "https://m.media-amazon.com/images/I/51XvDTAGK+L._SY355_.jpg"),
                
                Game(gameName: "Tristre", gameCompany: "Recycled J", gameImageUrl: "https://www.mondosonoro.com/wp-content/uploads/2021/09/Recycled-J-Sad-Summer.jpg")]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellGame : GameCell = tableView.dequeueReusableCell(withIdentifier: "cellGame", for: indexPath) as! GameCell
        
        cellGame.lbGame.text = game[indexPath.row].getTitle()
        cellGame.lbCompany.text = game[indexPath.row].getSubTitleCompany()
        
        let url = URL(string: game[indexPath.row].getImageUrl())
        
        let data = try? Data(contentsOf: url!)
        
        let ldImage: UIImage = UIImage(data: data!)!
        cellGame.ivPhoto.image = ldImage
        
        return cellGame
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let movedObject = self.game[sourceIndexPath.row]
            game.remove(at: sourceIndexPath.row)
            game.insert(movedObject, at: destinationIndexPath.row)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
    }

// se que falla pero me parece que esta todo bien 
}
        
    



