//
//  IndicacaoManager.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 05/02/22.
//

import Foundation

//MARK: - Protocol
protocol IndicacaoManagerDelegate: NSObject {
    func updateResponseLabel(safeData: String)
}

class IndicacaoManager {
    
    //delegate
    weak var delegate: IndicacaoManagerDelegate?
    
    //MARK: - API CALL
    func makePostRequest(Indicacao: IndicacaoBody) {
        
        //URL
        guard let url = URL(string: "https://app.hinovamobile.com.br/ProvaConhecimentoWebApi/Api/Indicacao") else {return}
        var request = URLRequest(url: url)
        //METHOD
        request.httpMethod = "POST"
        //HEADER
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //BODY
        do {
            let encoder = JSONEncoder()
            let body = try encoder.encode(Indicacao)
            request.httpBody = body
            URLSession.shared.dataTask(with: request) { [self] data, response, error in
                guard let data = data, error == nil else {return}
                let safeData = self.getResponse(responseData: data)
                self.delegate?.updateResponseLabel(safeData:safeData)
            }.resume()
        } catch {
            print(error)
        }
    }
    
    //MARK: - PARSING RESPONSE
    func getResponse(responseData: Data) -> String {
        do {
            let response = try JSONDecoder().decode(APIResponse.self, from: responseData)
            if response.RetornoErro.retornoErro != nil {
                return response.RetornoErro.retornoErro ?? " "
            } else {
                print(response)
                return response.Sucesso ?? " "
            }
        } catch {
            print(error)
            return "Error"
        }
    }
}
