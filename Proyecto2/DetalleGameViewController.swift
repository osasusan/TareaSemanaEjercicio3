//
//  DetalleGameViewController.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 20/10/22.
//

import UIKit

class DetalleGameViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
    
    
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var descripText: UITextView!
    @IBOutlet weak var categoryView: UIPickerView!
    @IBOutlet weak var nameCategory: UILabel!
    
    var detailGame : Game?
    
    let category  = [ "Aventuras ","RPG","Plataformas","Accion"]
    
    var pickerView = UIPickerView()
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameCategory.text = category[row]
        
        detailGame?.gameGen = category[row]
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryView.delegate = self
        categoryView.dataSource = self
        
        
        
        gameName.text = detailGame?.game ??
        ""
        let url = URL(string: (detailGame?.getImageUrl())!)
        
        if let data = try?  Data(contentsOf: url!){
            let iM :UIImage = UIImage(data: data)!
            imageGame.image = iM
        }
        
        descripText.text = detailGame?.description ??
        ""
        nameCategory.text = detailGame?.gameGen ?? ""
        
    }
    
}
