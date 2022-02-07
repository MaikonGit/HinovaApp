//
//  OficinasManager.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 02/02/22.
//

import Foundation
//MARK: - Protocol
protocol OficinaManagerDelegate: NSObject {
    func didUpdateOficinas(oficinas: [ListaOficinas])
}

struct OficinaManager {
   
    //delegate
    weak var delegate: OficinaManagerDelegate?
    
    //MARK: - API CALL
    //URL
    let oficinaURL = "https://app.hinovamobile.com.br/ProvaConhecimentoWebApi/Api/Oficina?"
    
    //BUSCAR OFICINA
    func fetchOficina(cpf: String, assocacaoNMR: Int) {
        let urlString = "\(oficinaURL)codigoAssociacao=\(assocacaoNMR)&cpfAssociado=\(cpf)"
        performRequest(urlString: urlString)
    }
    
    //PERFORM REQUEST
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if  let oficinas = self.parseJSON(oficinaData: safeData) {
                        self.delegate?.didUpdateOficinas(oficinas: oficinas)
                    }
                }
            }
            task.resume()
        }
    }
    
    //MARK: - JSON PARSING
    func parseJSON(oficinaData: Data) -> [ListaOficinas]? {
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(OficinaData.self, from: oficinaData)
            return decodedData.ListaOficinas

        } catch {
            print(error)
            return nil
        }
    }
}
