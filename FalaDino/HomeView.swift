//
//  HomeView.swift
//  FalaDino
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct HomeView: View {
    let username: String = "Olá Amiguinho"
    let topics = ["Animais", "Objetos", "Dia a Dia", "Frutas", "Cores", "Emocoes"]
    let topicImages = ["animals", "Objects", "day to day", "fruits", "colors", "Emotions"]
    
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
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                // Grade de botões
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(0..<topics.count, id: \.self) { index in
                        NavigationLink(destination: InteractiveView(topic: topics[index])) {
                            Image(topicImages[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue.opacity(0.3)))
                                .padding()
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.orange.opacity(0.3)) // Fundo verde pastel
            .edgesIgnoringSafeArea(.all) // Faz o fundo cobrir toda a tela
        }
    }
}
