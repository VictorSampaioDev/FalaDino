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
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(0..<buttonImages.count, id: \.self) { index in
                    Button(action: {
                        playSound(named: sounds[index])
                    }) {
                        Image(buttonImages[index])
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
        .background(Color.green.opacity(0.4)) // Fundo verde pastel
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
