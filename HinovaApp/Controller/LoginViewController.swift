//
//  LoginViewController.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 02/02/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    //shared prop
    var oficinaManager = OficinaManager()
    var dataSourceNumber = [601,601]
    var dataSourceName = ["Selecione uma Associação", "Hinova Associação"]
    
    //outlets
    @IBOutlet weak var errorMSG: UILabel!
    @IBOutlet weak var contornoPV: UIView!
    @IBOutlet weak var cpfTF: UITextField!
    @IBOutlet weak var associacaoPV: UIPickerView!
    
    var associacaoNMR = 0
    
    //viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegates
        cpfTF.delegate = self
        associacaoPV.delegate = self
        associacaoPV.delegate = self
        
        //defult conf.
        contornoPV.layer.cornerRadius = 8.0
        contornoPV.layer.borderWidth = 0.5
        contornoPV.layer.borderColor = UIColor.systemGreen.cgColor
        
        cpfTF.layer.cornerRadius = 5.0
        cpfTF.layer.borderWidth = 0.5
        cpfTF.layer.borderColor = UIColor.systemGreen.cgColor
        
        errorMSG.text = "  "
        
    }
    
    @IBAction func pesquisarBTN(_ sender: UIButton) {
        if cpfTF.text != "" && associacaoNMR != 0 {
            guard let cpf = cpfTF.text else {return}
            let oficinasVC = OficinasViewController()
            oficinasVC.associacaoNMR = associacaoNMR
            oficinasVC.cpfToFetch = cpf
            cpfTF.endEditing(true)
            errorMSG.text = "  "
            navigationController?.pushViewController(oficinasVC, animated: true)
        } else {
            errorMSG.text = "Selecione uma associação e digite um CPF válido."
        }
    }
    
    @IBAction func indiqueBTN(_ sender: UIButton) {
        let indiqueVC = IndicacaoViewController()
        navigationController?.pushViewController(indiqueVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cpfTF.endEditing(true)
        return true
    }
}

//MARK: - PickerView Delegate
extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dataSourceNumber.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        associacaoNMR = dataSourceNumber[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSourceName[row]
    }
}
