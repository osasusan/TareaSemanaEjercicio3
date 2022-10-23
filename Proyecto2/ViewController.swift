//
//  ViewController.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 4/10/22.
//

import UIKit

class VCMain: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    
    @IBOutlet weak var tableGames: UITableView!
    
    var gameToSend : Game?
    
var listGame = [Game(gameName: "Destiny", companyName: "Bungie",descripcion: "Eyes up, Guardian. It's a bleak solar system out there, but as long as any of the Traveler's Light persists, so too will hope Each class of Guardians has a different personality and set of advantages, but they're all immensely powerful, so you can't go wrong. If you don't love your initial choice, use a different save slot to try another class. Destiny's most dedicated players often end up using their three save slots to make one of each class!",gen: "",image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fassets.vg247.com%2Fcurrent%2F2014%2F11%2Fdestiny1.jpg&f=1&nofb=1&ipt=d447bc68a85445193f38dc93a5aaab76f5489e4e38ab53fbbf0db3b5b4d9f3e9&ipo=images"), Game(gameName: "Destiny 2", companyName:"Bungie",descripcion: "Eyes up, Guardian. It's a bleak solar system out there, but as long as any of the Traveler's Light persists, so too will hope      Each class of Guardians has a different personality and set of advantages, but they're all immensely powerful, so you can't go wrong. If you don't love your initial choice, use a different save slot to try another class. Destiny 2 's most dedicated players often end up using their three save slots to make one of each class ",gen: "", image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.gratistodo.com%2Fwp-content%2Fuploads%2F2017%2F07%2FDestiny-2-Wallpapers-2.jpg&f=1&nofb=1&ipt=c66240e2836d020293c65c6366496931c1c40e1a569cd1ab122ba847ec5c4d0c&ipo=images"),Game (gameName:"see of thives", companyName: "Rare Ltd",descripcion: "Sea of Thieves es un videojuego de acción-aventura en primera persona desarrollado por Rare y distribuido por Xbox Game Studios, para las plataformas Xbox One y Microsoft Windows.​​​ El videojuego fue lanzado a la venta el 20 de marzo de 2018.",gen: "", image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.windowsreport.com%2Fwp-content%2Fuploads%2F2020%2F01%2FSea-of-Thieves.jpg&f=1&nofb=1&ipt=fa64d105617f3d45f3b8ad2a2be524f54bd1d36a26ce182f42d007eae4712110&ipo=images")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return listGame.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gameCell : CellGames = tableView.dequeueReusableCell(withIdentifier: "clGame", for: indexPath) as! CellGames
        let gName = listGame[indexPath.row].getTitle()
        gameCell.lbGame.text = gName
        
        let cName = listGame[indexPath.row].getSubTitleCompany()
        gameCell.lbCompany.text = cName
        
        let image = URL(string:listGame[indexPath.row].getImageUrl())
        let data = try? Data (contentsOf: image!)
        let phData : UIImage = UIImage(data:data!)!
        gameCell.imageGame.image = phData
        return gameCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gameToSend = listGame[indexPath.row]
        performSegue(withIdentifier: "sendGame", sender: self)
      
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendGame"{
            let destino = segue.destination as! DetalleGameViewController
            destino.detailGame = gameToSend!
        }
    }
    override func viewDidLoad() {
        tableGames.dataSource = self
        tableGames.delegate = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}

