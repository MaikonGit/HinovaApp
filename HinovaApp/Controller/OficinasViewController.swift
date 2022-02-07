//
//  OficinasViewController.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 02/02/22.
//

import UIKit

class OficinasViewController: UIViewController {
    
    //MARK: - shared prop.
    let descricaoVC = DescricaoViewController()
    var oficinaManager = OficinaManager()
    var cpfToFetch = ""
    var associacaoNMR = 0
    
    //default tableView conf.
    var oficinasArray: [ListaOficinas] = []
    var descCurta = ""
    var oficinaNome = ""
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation Controller
        configureNC()
        
        //Delegates
        tableView.delegate = self
        tableView.dataSource = self
        oficinaManager.delegate = self
        
        //fetch data
        oficinaManager.fetchOficina(cpf: self.cpfToFetch, assocacaoNMR: associacaoNMR)
        
        //register cell to tableView
        tableView.register(UINib(nibName: "OficinasTableViewCell", bundle: nil), forCellReuseIdentifier: "OficinaCell")
    }
    
    // navigationController setup
    func configureNC() {
        title = "Oficinas"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
    }
}

//MARK: - TABLE VIEW DELEGATE - EXTENSION
extension OficinasViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oficinasArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OficinaCell", for: indexPath) as! OficinasTableViewCell
        cell.nomeOficina.text = oficinasArray[indexPath.row].Nome
        cell.descricaoOficina.text = oficinasArray[indexPath.row].DescricaoCurta
        return cell
    }
    
    //MARK: - DID SELECT ROW AT:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            descricaoVC.oficina = oficinasArray[indexPath.row]
            let newDescricaoVC = DescricaoViewController()
            newDescricaoVC.oficina = oficinasArray[indexPath.row]
            navigationController?.pushViewController(newDescricaoVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

//MARK: - Oficina Manager Delegate
extension OficinasViewController: OficinaManagerDelegate {
    func didUpdateOficinas(oficinas: [ListaOficinas]) {
        DispatchQueue.main.async {
            self.oficinasArray = oficinas
            self.tableView.reloadData()
        }
    }
}
