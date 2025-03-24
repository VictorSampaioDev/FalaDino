//
//  DadosSwift.swift
//  FalaDino
//
//  Created by found on 24/03/25.
//

import Foundation

// Estrutura que representa um item (nome, imagem, som)
struct Item: Identifiable {
    var id = UUID()
    var nome: String
    var imagem: String
    var som: String
}

// Dicionário contendo os tópicos e seus respectivos itens
let topicos: [String: [Item]] = [
    "Animais": [
        Item(nome: "Leão", imagem: "leao", som: "leao_som"),
        Item(nome: "Girafa", imagem: "girafa", som: "girafa_som"),
        Item(nome: "Elefante", imagem: "elefante", som: "elefante_som"),
        Item(nome: "Macaco", imagem: "macaco", som: "macaco_som"),
        Item(nome: "Zebra", imagem: "zebra", som: "zebra_som"),
        Item(nome: "Hipopótamo", imagem: "hipopótamo", som: "hipopotamo_som"),
    ],
    "Objetos": [
        Item(nome: "Lápis", imagem: "lápis", som: "lapis_som"),
        Item(nome: "Cadeira", imagem: "cadeira", som: "cadeira_som"),
        Item(nome: "Pincel", imagem: "pincel", som: "pincel_som")
    ],
    "Emoções": [
        Item(nome: "Feliz", imagem: "feliz", som: "feliz_som"),
        Item(nome: "Triste", imagem: "triste", som: "triste_som"),
        Item(nome: "Bravo", imagem: "bravo", som: "bravo_som")
    ],
    "Frutas": [
        Item(nome: "Maçã", imagem: "maca", som: "maca_som"),
        Item(nome: "Banana", imagem: "banana", som: "banana_som"),
        Item(nome: "Morango", imagem: "morango", som: "morango_som"),
        Item(nome: "Uva", imagem: "uva", som: "uva_som"),
        Item(nome: "Abacaxi", imagem: "abacaxi", som: "abacaxi_som"),
        Item(nome: "Melancia", imagem: "melancia", som: "melancia_som"),
    ],
    "Cores": [
        Item(nome: "Vermelho", imagem: "vermelho", som: "vermelho_som"),
        Item(nome: "Azul", imagem: "azul", som: "azul_som"),
        Item(nome: "Verde", imagem: "verde", som: "verde_som")
    ],
    "Dia a Dia": [
        Item(nome: "Dormir", imagem: "dormir", som: "dormir_som"),
        Item(nome: "Comer", imagem: "comer", som: "comer_som"),
        Item(nome: "Escovar os Dentes", imagem: "escovar_dentes", som: "escovar_dentes_som")
    ]
]
