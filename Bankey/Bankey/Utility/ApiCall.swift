//
//  ApiCall.swift
//  Bankey
//
//  Created by Irfan Khan on 10/01/24.
//

//import Foundation
//
//func fetchCoinMarketCapData() {
//    // Replace "YOUR_API_KEY" with your actual CoinMarketCap API key
//    let apiKey = "5471880b-91c0-477b-826b-923f52238e80"
//    let urlString = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10"
//    
//    guard let url = URL(string: urlString) else { return }
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.addValue("application/json", forHTTPHeaderField: "Accept")
//    request.addValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
//    
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let error = error {
//            print("Error: \(error)")
//        } else if let data = data {
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//                // Process the JSON data as needed
//            } catch {
//                print("Error parsing JSON: \(error)")
//            }
//        }
//    }
//    
//    task.resume()
//}

