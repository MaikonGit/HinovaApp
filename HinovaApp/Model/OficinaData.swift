//
//  OficinaData.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 02/02/22.
//

import Foundation

struct OficinaData: Codable {
    let ListaOficinas: [ListaOficinas]
}
struct ListaOficinas: Codable {
    let Nome: String
    let Id: Int
    let Descricao: String
    let DescricaoCurta: String
    let Endereco: String
    let Latitude: String
    let Longitude: String
    let Foto: String
    let AvaliacaoUsuario: Int
    let CodigoAssociacao: Int
    let Email: String
    let Telefone1: String?
    let Telefone2: String?
    let Ativo: Bool
}
