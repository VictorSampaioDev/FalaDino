//
//  HomeView.swift
//  FalaDino
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct HomeView: View {
    let username: String = "Olá Amiguinho"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Topo: Logo + Nome do Usuário
                HStack {
                    Image("app_logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text(username)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 50)
                    
                    Spacer()
                }
                
                Spacer()
                
                // Lista de Tópicos
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(topicos.keys.sorted(), id: \.self) { topico in
                            NavigationLink(destination: InteractiveView(topic: topico)) {
                                HStack {
                                    Image(topico.lowercased()) // Usando imagem do tópico
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding()
                                    
                                    Text(topico)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .frame(width: 330, height: 100) // Tamanho do botão
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange.opacity(0.7)))
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.orange.opacity(0.3))
            .edgesIgnoringSafeArea(.all)
        }
    }
}
