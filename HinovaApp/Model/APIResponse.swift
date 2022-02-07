//
//  APIResponse.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 07/02/22.
//

import Foundation

struct APIResponse: Codable {
    let RetornoErro: RetornoErro
    let Sucesso: String?
    struct RetornoErro: Codable {
        let retornoErro: String?
    }
}


