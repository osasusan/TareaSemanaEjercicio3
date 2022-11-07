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
    var nGame = [""]
    
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
    var refreshControl : UIRefreshControl {
        let reefresControl = UIRefreshControl()
        reefresControl.addTarget(self, action: #selector(self.actualizarTabla(_:)), for: .valueChanged)
        return reefresControl
    }
    @objc func actualizarTabla(_ reefresControl : UITableView){
        self.tableGames.reloadData()
        self.tableGames.refreshControl?.endRefreshing()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableGames.dataSource = self
        tableGames.delegate = self
        self.tableGames.addSubview(refreshControl)
        
        

        // Code to refresh table view
        
        //addNewGame()
    }
    func refreshTable(notification: NSNotification) {

        print("Received Notification")
        self.tableGames.reloadData()
    }
    
    @IBAction func getNewGame(_ sender: Any) {
        performSegue(withIdentifier: "addGame", sender: self)
        
        
    }
    func upDateTable(name:String,company:String,descripcion:String,genero:String,foto:String){
        listGame.append(Game(gameName: name, companyName: company, descripcion: descripcion, gen: genero, image: foto))
        
       
      
       
      
    }
   /* func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }

        return String(data: data as Data, encoding: String.Encoding.utf8)
    }

    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }

        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        }*/
    
    //func showToast(mensage : String){
    //    let label = UILabel(frame: CGRect(x: <#T##CGFloat#>, y: CGFloat, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
    //
    //}
}
    

    
    /*
    private func addNewGame(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:.add,
            target: self,
            action:#selector(addViewControler)
        )
    }*/
 /*@objc
   private func addViewControler(){
       // 1 - instanciar story (UI Stroy (nombre , nil )
       // 2- isntanciar view controle _ story.intateViewController
        //3- referencia VC actual
        // hacer dismissVC.self
        //5- tablbeVIe reload data
       performSegue(withIdentifier: "addGame", sender: self)
        guard let story = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "addNew")as? NewGmaeVC else{return}
            present(story, animated: true ,completion: nil)

           // performSegue(withIdentifier: "addNew", sender: self)
            
        
        
        self.navigationController?.pushViewController(NewGmaeVC(), animated: true)
   }*/
    
    


