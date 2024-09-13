//
//  ContentView.swift
//  requetemeteo
//
//  Created by administrateur on 13/09/2024.
//

import SwiftUI
struct ContentView: View {
    @State var meteo:Meteodata?
    var body: some View {
        VStack(spacing:20){
            Circle()
                .foregroundColor(.secondary)
                .frame(width: 120,height: 120)
            Text("test")
                .bold()
                .font(.title)
            Text(meteo?.city.name ?? "doit afficher la ville" )
                .padding()
            
            Spacer()
        }
        .padding()
        
        .task {
            do{
               meteo = try await getMeteo()
            }catch MeteoError.invalidURL{
                print("invalid URL")
            }catch MeteoError.invalidData
            {print("invalid Data")
            }catch MeteoError.invalidResponce
            {print("Invalid Response")
            }catch{
               print("Erreur inconnu")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
