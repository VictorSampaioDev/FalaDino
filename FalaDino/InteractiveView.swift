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
    @State private var showingSheet = false

    var body: some View {
        VStack {
            // Topo: Logo + Nome do Usuário
            HStack {
                Image("app_logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
                Spacer()
                
                Text("O Dino quer falar!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()

            Text(topic)
                .font(.title2)
                .padding()

            Spacer()

            // Grade de botões interativos
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(items) { item in
                    Button(action: {
                        selectedItem = item
                        showingSheet.toggle()
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.orange.opacity(0.7))
                                .frame(width: 170, height: 170)
                                .overlay(
                                    VStack {
                                        Image(item.imagem)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                        
                                        Text(item.nome)
                                            .font(.headline)
                                            .foregroundColor(.white)
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
        .background(Color.orange.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showingSheet) {
            if let item = selectedItem {
                HalfScreenSheet(buttonImage: item.imagem, sound: item.som, dismissAction: {
                    showingSheet = false
                })
            }
        }
    }
}
struct HalfScreenSheet: View {
        let buttonImage: String
        let sound: String
        let dismissAction: () -> Void // Função para fechar a sheet
        
        var body: some View {
            VStack {
                // 🔹 Botão de Voltar
                HStack {
                    Button(action: {
                        dismissAction() // Fecha a sheet
                    }) {
                        Image(systemName: "chevron.down")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                }

                Text("Escolha uma ação")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, -10)

                Image(buttonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()

                // 🔹 Botão de Ouvir som
                Button(action: {
                    playSound(named: sound)
                }) {
                    VStack {
                        Image(systemName: "speaker.wave.2.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                        Text("Ouvir Som")
                    }
                    .frame(width: 120, height: 120)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.green.opacity(0.7)))
                    .foregroundColor(.white)
                }

                Spacer()
            }
            .padding()
            .presentationDetents([.medium]) // Define a altura da sheet (metade da tela)
        }
    }

func playSound(named soundName: String) {
    if let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
        var player: AVAudioPlayer?
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
        } catch {
            print("Erro ao tocar o som: \(error.localizedDescription)")
        }
    }
}
