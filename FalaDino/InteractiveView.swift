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
    let username: String = "O Dino quer falar!"
    let buttonImages = ["image1", "image2", "image3", "image4", "image5", "image6"]
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
            Text (topic)
                .font(.title2)
                .padding()

            Spacer()

            // Grade de botões interativos
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(0..<buttonImages.count, id: \.self) { index in
                    Button(action: {
                        playSound(named: sounds[index])
                    }) {
                        Image(buttonImages[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 170)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange.opacity(0.7)))
                            
                    }
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.orange.opacity(0.3)) // cor de fundo
         .edgesIgnoringSafeArea(.all) // Faz o fundo cobrir toda a tela
    }

    // Função para tocar o som associado ao botão
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
}
