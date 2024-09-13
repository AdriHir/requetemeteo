//
//  meteoMethode.swift
//  requetemeteo
//
//  Created by administrateur on 13/09/2024.
//

import Foundation

    
        
        
    func getMeteo() async throws ->Meteodata{
        let urlmeteo = "https://api.meteo-concept.com/api/ephemeride/1?token=e05bc52840d998ee664dcacdddececa7228bfa119b8051ac938f6be295395bd1&insee=35238"
        guard let url = URL(string: urlmeteo) else {
            
            throw MeteoError.invalidURL
            //Condition si url est bonne sinon met une erreur du swich case
        }
        
        let (data,response) = try await URLSession.shared.data(from:url)
        
        guard let response = response as? HTTPURLResponse,response.statusCode==200 else {
            throw MeteoError.invalidResponce
            // conditionn url bonne mais si la reponsen'est pas 0200( ok) alors switch case  invalid
        }
        // si url & response est ok alors :
        do {
            let meteoDecode = JSONDecoder()
            meteoDecode.keyDecodingStrategy = .convertFromSnakeCase
             let meteodata = try meteoDecode.decode(Meteodata.self, from: data)
            return meteodata
            
        }catch{
            throw MeteoError.invalidData
        }
        
    }




enum MeteoError:Error{
    case invalidURL
    case invalidResponce
    case invalidData
}
