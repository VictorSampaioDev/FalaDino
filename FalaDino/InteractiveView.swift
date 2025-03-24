//
//  ContentView.swift
//  FalaDino
//
//  Created by found on 20/03/25.
//

import SwiftUI
import AVFoundation

struct InteractiveView: View {
    @State private var showingSheet = false
    @State private var selectedIndex: Int? = nil // Guarda o índice do botão clicado
    
    let topic: String
    let username: String = "O Dino quer falar!"
    let buttonImages = ["image1", "image2", "image3", "image4", "image5", "image6"]
    let buttonNames = ["Leão", "Carro", "Casa", "Maçã", "Azul", "Feliz"] // Nomes dos botões
    let sounds = ["sound1", "sound2", "sound3", "sound4", "sound5", "sound6"]

    var body: some View {
        VStack {
            // Topo: Logo + Nome do Usuário
            HStack {
                Image("app_logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
                Spacer()
                
                Text(username)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()

            // Exibir o nome do tópico na tela
            Text(topic)
                .font(.title2)
                .padding()

            Spacer()

            // Grade de botões interativos
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(0..<buttonImages.count, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                        showingSheet.toggle() // Abre a tela modal
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.orange.opacity(0.7))
                                .frame(width: 170, height: 170)
                                .overlay(
                                    VStack {
                                        Image(buttonImages[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                        
                                        Text(buttonNames[index])
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
        .background(Color.orange.opacity(0.3)) // Cor de fundo
        .edgesIgnoringSafeArea(.all) // Faz o fundo cobrir toda a tela
        .sheet(isPresented: $showingSheet) {
            if let index = selectedIndex {
                // Sheet que aparece ao clicar no quadrado
                HalfScreenSheet(buttonImage: buttonImages[index], sound: sounds[index], dismissAction: {
                    showingSheet = false
                })
            }
        }
    }
}

// 🔹 Telinha modal que aparece ao clicar no quadrado
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

            HStack {
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

                Button(action: {
                    playSound(named: sound)
                }) {
                    VStack {
                        Image(systemName: "speaker.wave.2.bubble")
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
            }
            .padding(.bottom, 30)

            Spacer()
        }
        .padding()
        .presentationDetents([.medium]) // Define a altura da sheet (metade da tela)
    }
}

// Função para tocar o som
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


