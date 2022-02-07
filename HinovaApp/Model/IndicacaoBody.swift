//
//  IndicacaoBody.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 05/02/22.
//

import Foundation

public struct IndicacaoBody: Codable {
    let Indicacao: Indicacao
}
public struct Indicacao: Codable {    
    var CodigoAssociacao: String
    var DataCriacao: String
    var CpfAssociado: String
    var EmailAssociado: String
    var NomeAssociado: String
    var TelefoneAssociado: String
    var PlacaVeiculoAssociado: String
    var NomeAmigo: String
    var TelefoneAmigo: String
    var EmailAmigo: String
}

