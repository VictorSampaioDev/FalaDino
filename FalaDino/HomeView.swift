//
//  HomeView.swift
//  FalaDino
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct Topico: Identifiable{
    var id =  UUID()
    var nome: String
    var foto: String
    }


struct HomeView: View {
    let username: String = "Olá Amiguinho"
    let topics = ["Animais", "Objetos", "Dia a Dia", "Frutas", "Cores", "Emocoes"]
    let topicImages = ["animals", "Objects", "day to day", "fruits", "colors", "Emotions"]
    
    var body: some View {
        NavigationView {
            ZStack{
                 Color.orange.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
            }
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
                
                ScrollView {
                                   VStack(spacing: 16){ // Espaçamento entre os itens
                                       ForEach(0..<topics.count, id: \.self) { index in
                                           NavigationLink(destination: InteractiveView(topic: topics[index])) {
                                               HStack {
                                                   Image(topicImages[index])
                                                       .resizable()
                                                       .scaledToFit()
                                                       .frame(width: 80, height: 80)
                                                       .padding()
                                                   
                                                   Text(topics[index])
                                                       .font(.title2)
                                                       .fontWeight(.bold)
                                                       .foregroundColor(.white)
                                                   
                                                   Spacer()
                                               }
                                               
                                               .frame(width: 330, height: 200) // Define tamanho do retângulo
                                               .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange.opacity(0.7)))
                                               .padding(.horizontal)
                                           }
                                       }
                                   }
                                   .padding(.top, 20) // Ajuste no topo para não colar na logo
                               }
                           }
                
                Spacer()
            }
            .padding()
            .background(Color.orange.opacity(0.3)) // cor de fundo
            .edgesIgnoringSafeArea(.all) // Faz o fundo cobrir toda a tela
        }
    }

