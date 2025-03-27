//
//  HomeView.swift
//  FalaDino
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct HomeView: View {
    let username: String = "Olá Amigo, Vamos Começar!!!"
    
    let lista: [String: String] = [
        "Animais": "macaco_image",
        "Objetos": "lapis",
        "Emoções": "feliz",
        "Frutas": "maca",
        "Cores": "azul",
        "Dia a Dia": "casa"
    ]

    // 🔹 Ordem específica dos tópicos na tela
    let ordemLista: [String] = ["Animais", "Objetos", "Frutas", "Emoções", "Cores", "Dia a Dia"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.opacity(0.2).ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    // 🔹 Topo: Logo + Nome do Usuário
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(.top, 70)
                            .padding(.leading)
                        Text(username)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 80)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.bottom, 40)
                  
                    // 🔹 Lista de Tópicos
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(ordemLista, id: \.self) { topico in
                                if let imagem = lista[topico] { // Pegando a imagem correta do dicionário
                                    NavigationLink(destination: InteractiveView(topic: topico)) {
                                        HStack {
                                            Image(imagem) // Mostra a imagem correta do tópico
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                                .padding()
                                            
                                            Text(topico)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        .frame(width: 330, height: 170) // Ajuste do tamanho do botão
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow.opacity(0.4)))
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
