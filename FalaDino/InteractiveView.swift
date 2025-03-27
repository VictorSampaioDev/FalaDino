//
//  ContentView.swift
//  FalaDino
//
//  Created by found on 20/03/25.
//

import SwiftUI
import AVFoundation

struct InteractiveView: View {
    let topic: String
    let items: [Item] // Lista de itens do tópico
    
    init(topic: String) {
        self.topic = topic
        self.items = topicos[topic] ?? [] // Obtém os itens do dicionário
    }
    
    @State private var selectedItem: Item? = nil

    var body: some View {
        VStack {
            // 🔹 Topo: Logo + Nome do Usuário
            HStack {
                Image("app_logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
                Spacer()
                
                Text("Vamos Começar!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 70)
                
                Spacer()
            }
            .padding()

            Text(topic)
                .font(.title2)
                .padding()

            Spacer()

            // 🔹 Grade de botões interativos
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(items) { item in
                    Button(action: {
                        selectedItem = item
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow.opacity(0.4))
                                .frame(width: 170, height: 170)
                                .overlay(
                                    VStack {
                                        Image(item.imagem)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                        
                                        Text(item.nome)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.top, 5)
                                    }
                                )
                        }
                    }
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.orange.opacity(0.2)).ignoresSafeArea()
        .sheet(item: $selectedItem) { item in
            HalfScreenSheet(buttonImage: item.imagem, sound: item.som, dismissAction: {
                selectedItem = nil // Fecha a sheet corretamente
            })
        }
    }
}

struct HalfScreenSheet: View {
    let buttonImage: String
    let sound: String
    let dismissAction: () -> Void // Função para fechar a sheet
    
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            // 🔹 Botão de Fechar
            Button(action: {
                dismissAction() // Fecha a sheet
            }) {
                Image(systemName: "chevron.down")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
            }
            
            Spacer()

            Text("Se Diz")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, -10)
            
            Image(buttonImage)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()

            // 🔹 Botão de Tocar Som
            Button(action: {
                playSound(named: sound)
            }) {
                VStack {
                    Image("audio1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding()
                }
                .frame(width: 250, height: 150)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow.opacity(0.4)))
                .foregroundColor(.white)
            }
            .padding(.bottom, 30)

            Spacer()
        }
        .padding()
        .presentationDetents([.medium]) // Define a altura da sheet (metade da tela)
    }
    
    // 🔹 Função para tocar o som corretamente
    func playSound(named soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("⚠️ Arquivo de som '\(soundName).mp3' não encontrado!")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Erro ao tocar o som: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HomeView()
}
