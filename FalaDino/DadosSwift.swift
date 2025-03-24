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
        Item(nome: "Gato", imagem: "gato", som: "gato_som"),
        Item(nome: "Elefante", imagem: "elefante", som: "elefante_som"),
        Item(nome: "Cachorro", imagem: "Cachorro", som: "cachorro_som")
    ],
    "Objetos": [
        Item(nome: "Carro", imagem: "carro", som: "carro_som"),
        Item(nome: "Avião", imagem: "aviao", som: "aviao_som"),
        Item(nome: "Relógio", imagem: "relogio", som: "relogio_som")
    ],
    "Emoções": [
        Item(nome: "Feliz", imagem: "feliz", som: "feliz_som"),
        Item(nome: "Triste", imagem: "triste", som: "triste_som"),
        Item(nome: "Bravo", imagem: "bravo", som: "bravo_som")
    ],
    "Frutas": [
        Item(nome: "Maçã", imagem: "maca", som: "maca_som"),
        Item(nome: "Banana", imagem: "banana", som: "banana_som"),
        Item(nome: "Morango", imagem: "morango", som: "morango_som")
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
