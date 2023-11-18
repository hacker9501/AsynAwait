//
//  Provider.swift
//  AsynAwait
//
//  Created by Elver Mayta Hernández on 16/11/23.
//

import Foundation

class Provider {
    
    static let shared = Provider()
    
    func getApi(rut: String, country: String, completion:  ((Result<ApiClienteResponse, Error>) -> Void)?) {
        let url = "https://m1.webcontrolcorp.com/ws/barrick/api/v1/credentialCertificado/\(rut)/\(country)"
        let fileUrl = URL(string: url)
        var request = URLRequest(url: fileUrl!)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    let response = ApiClienteResponse(Success: false, Message: "Error en la solicitud",Data: nil)
                    print(response)
                    completion!(.failure(error!))
                }
                return
            }
            if let data = data {
                do {
                    var movieData = [String: Any]()
                    movieData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    let response = ApiClienteResponse(Success: true,Message: "Solicitud exitosa", Data: movieData)
                    print(response)
                    completion!(.success(response))
                } catch let error as NSError {
                    print(error)
                }
                    
            }
        }.resume()
    }


}


