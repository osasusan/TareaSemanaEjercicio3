//
//  NewGameVC.swift
//  Proyecto2
//
//  Created by Osasu sanchez on 23/10/22.
//

import Foundation
import UIKit

class NewGmaeVC : UIViewController {
    
    let category  = ["Aventuras ","RPG","Plataformas","Accion"]
    
    @IBOutlet weak var etTilteGame: UITextField!
    @IBOutlet weak var etCompanyGame: UITextField!
    @IBOutlet weak var etDescription: UITextField!
    @IBOutlet weak var tvCategory: UILabel!
    @IBOutlet weak var CategoryPickerView: UIPickerView!
    @IBOutlet weak var ivImage: UIImageView!
    
    var pikerView = UIPickerView()
   
    
    let vc = VCMain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryPickerView.delegate = self
        CategoryPickerView.dataSource = self
        
        
       
    }
    override func touchesBegan(_ touches : Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // for press return key
    func textFieldShouldReturn( textField : UITextField) -> Bool {
        etDescription.resignFirstResponder()
        etTilteGame.resignFirstResponder()
        etCompanyGame.resignFirstResponder()
        return (true)
    }
        
    
    @IBAction func addImage(_ sender: Any) {
        getImage()
        
    }
    
    
    @IBAction func addElement(_ sender: Any) {
        if etTilteGame.text!.isEmpty || etDescription.text!.isEmpty || etCompanyGame.text!.isEmpty || tvCategory.text == ""{
            mensage(tilte: "ERROR", messeg: "hay campos vacios")
        }else {
            
            let name = etTilteGame.text!
            let company = etCompanyGame.text!
            let descrition = etDescription.text!
            let genoro = tvCategory.text!
            let photo = ""
            vc.upDateTable(name: name, company: company, descripcion: descrition, genero: genoro, foto: photo)
            etTilteGame.text = ""
            etDescription.text = ""
            etCompanyGame.text = ""
            tvCategory.text = ""
            ivImage.image = UIImage(systemName: "doc.text.image")
            
           
        }
    }    
    
}



extension NewGmaeVC : UIPickerViewDelegate , UIPickerViewDataSource , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tvCategory.text = category[row]
    }
    func mensage( tilte:String , messeg : String){
        
        let alert = UIAlertController(title: tilte, message:messeg, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "okay", style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
    func getImage(){
        let aletSheet = UIAlertController(title: "foto de guego", message: "de donde quieres sacar la imagen ", preferredStyle: UIAlertController.Style.actionSheet)
        let camera = UIAlertAction(title: "camera", style: .default, handler: self.goCamera)
        let galery = UIAlertAction(title: "Galeria", style: .default,handler: self.goLibrery)
        let url = UIAlertAction(title: "URL", style: .default )
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler:nil)
        
        aletSheet.addAction(cancel)
        aletSheet.addAction(camera)
        aletSheet.addAction(galery)
        aletSheet.addAction(url)
        self.present(aletSheet,animated: true, completion: nil)
    }
    func goCamera(alert: UIAlertAction){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    func goLibrery(alert : UIAlertAction){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let im  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        ivImage?.image = im
        
        self.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true,completion: nil)
        
    }

    
    
    
    
    
    
}


