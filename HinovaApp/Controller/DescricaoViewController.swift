//
//  DescricaoViewController.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 02/02/22.
//

import UIKit

class DescricaoViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var nomeOficina: UILabel!
    @IBOutlet weak var descricaoTV: UITextView!
    @IBOutlet weak var endereçoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var infoContornoView: UIView!
    var telefone1 = ""
    var telefone2 = ""
    
    //shared prop.
    var oficina: ListaOficinas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //outlets upload
        nomeOficina.text = oficina?.Nome
        idLabel.text = "Id: \(oficina!.Id)"
        descricaoTV.text = oficina?.Descricao
        endereçoLabel.text = oficina?.Endereco
        emailLabel.text = oficina?.Email
        telefone1 = oficina?.Telefone1 ?? "Numero Indisponível"
        telefone2 = oficina?.Telefone2 ?? "Número Indisponível"
        
        // navigationController conf.
        configureNC()
        
        //default prorp.
        infoContornoView.layer.cornerRadius = 8.0
        infoContornoView.layer.borderWidth = 0.5
        infoContornoView.layer.borderColor = UIColor.systemGreen.cgColor
        
        descricaoTV.layer.cornerRadius = 8.0
        descricaoTV.layer.borderWidth = 0.5
        descricaoTV.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    //configurando navigationController
    func configureNC() {
        title = "Oficina Credenciada"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        
    }
    
    //botao telefone 1
    @IBAction func tel1Pressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ligar para:", message: telefone1, preferredStyle: .alert)
        
        //alert telefone buttom action
        let action = UIAlertAction(title: "Ligar", style: .default) { (action) in
            //efetuar ligacao
        }
        //presenting alert box
        present(alert, animated: true, completion: nil)
        
        if telefone1 == oficina?.Telefone1 {
            //action button
            alert.addAction(action)
            //Cancel Buttom
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        } else {
            //Cancel Buttom
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        }
        
    }
    
    @IBAction func tel2Pressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ligar para:", message: telefone2, preferredStyle: .alert)
        
        //alert telefone buttom action
        let action = UIAlertAction(title: "Ligar", style: .default) { (action) in
            //efetuar ligacao
        }
        //presenting alert box
        present(alert, animated: true, completion: nil)
        
        if telefone2 == oficina?.Telefone2 {
            //action button
            alert.addAction(action)            
            //Cancel Buttom
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        } else {
            //Cancel Buttom
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        }
    }
}


