//
//  ViewModel.swift
//  AsynAwait
//
//  Created by Elver Mayta Hernández on 16/11/23.
//

import Foundation

class ViewModel {
    
    private let provider = Provider.shared
    
    func getCredencial(rut:String ,country: String) async throws -> ApiClienteResponse {
        try await withCheckedContinuation { continuation in
            provider.getApi(rut: rut, country: country) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error as! Never)
                }
            }
        }
        
    }
    
    func DataPais() async {
        do {
            async let model = getCredencial(rut: "138629856", country: "PE")
        } catch {
            print("Error de servicio")
        }
    }
    
}



