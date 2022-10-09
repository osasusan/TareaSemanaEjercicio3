//
//  ViewController.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 4/10/22.
//

import UIKit

class VcMain: UITableViewController{
    
   

    
    var game = [Game(gameName: " Valorant", gameCompany: "Riot game",gameImageUrl:              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fplaypc.io%2Fwp-content%2Fuploads%2F2020%2F06%2Fvalorant.jpg&f=1&nofb=1&ipt=5fb6ba8730fc4b195873eecaa408b5372dca9c84ba0b1090e9acab8445707ad8&ipo=images"),
                
                Game(gameName: "Rocket league", gameCompany: "psyonix J", gameImageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.everyeye.it%2Fimg-articoli%2Frocket-league-championship-series-competizione-esport-targata-psyonix-v5-38122.jpg&f=1&nofb=1&ipt=c14e4a2e147d32dddcb04258f03f990f1a5abbec9ee69616882ba6f85b2b30c9&ipo=images")]
    
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
        
    



