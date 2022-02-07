//
//  IndicacaoViewController.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 05/02/22.
//

import UIKit

class IndicacaoViewController: UIViewController {
    //outlets
    @IBOutlet weak var nomeAssociadoTF: UITextField!
    @IBOutlet weak var codigoAssociacaoTF: UITextField!
    @IBOutlet weak var placaTF: UITextField!
    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var telAssociadoTF: UITextField!
    @IBOutlet weak var cpfAssociadoTF: UITextField!
    @IBOutlet weak var emailAssociadoTF: UITextField!
    @IBOutlet weak var nomeAmigoTF: UITextField!
    @IBOutlet weak var telAmigoTF: UITextField!
    @IBOutlet weak var emailAmigoTF: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    //shared prop.
    let indicacaoManager = IndicacaoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NavigationController conf.
        configureNC()
        
        //default conf.
        setupVC(outlet: nomeAssociadoTF)
        setupVC(outlet: codigoAssociacaoTF)
        setupVC(outlet: placaTF)
        setupVC(outlet: dataTF)
        setupVC(outlet: telAssociadoTF)
        setupVC(outlet: cpfAssociadoTF)
        setupVC(outlet: emailAssociadoTF)
        setupVC(outlet: nomeAmigoTF)
        setupVC(outlet: telAmigoTF)
        setupVC(outlet: emailAmigoTF)
        responseLabel.text = "  "
        
        //delegate
        indicacaoManager.delegate = self
    }
    // navigationController setup
    func configureNC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
    }
    //setting TextField
    func setupVC(outlet: UITextField) {
        outlet.layer.cornerRadius = 5.0
        outlet.layer.borderWidth = 0.5
        outlet.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    //botao enviar
    @IBAction func enviarPressed(_ sender: UIButton) {
        let indicacaoConteudo = Indicacao(CodigoAssociacao: codigoAssociacaoTF.text!, DataCriacao: dataTF.text!, CpfAssociado: cpfAssociadoTF.text!, EmailAssociado: emailAssociadoTF.text!, NomeAssociado: nomeAssociadoTF.text!, TelefoneAssociado: telAssociadoTF.text!, PlacaVeiculoAssociado: placaTF.text!, NomeAmigo: nomeAmigoTF.text!, TelefoneAmigo: telAmigoTF.text!, EmailAmigo: emailAmigoTF.text!)
        
        let IndicacaoBody = IndicacaoBody(Indicacao: indicacaoConteudo)
        indicacaoManager.makePostRequest(Indicacao: IndicacaoBody)
    }
}

//MARK: - Indicacao Manager Delegate
extension IndicacaoViewController: IndicacaoManagerDelegate {
    func updateResponseLabel(safeData: String) {
        DispatchQueue.main.async {
            self.responseLabel.text = safeData
        }
    }
}
