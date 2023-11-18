//
//  Model.swift
//  AsynAwait
//
//  Created by Elver Mayta Hernández on 17/11/23.
//

import Foundation

struct ApiClienteResponse{
    var Success : Bool
    var Message : String?
    var Data: [String:Any]?
}

struct DataResponse: Decodable {
    var FLICCONDUCIR : String?
    var FPSICOSENSOTECNICO: String?
    var FINGRESO : String?
    var MUNICIPAL : String?
    var ZONA : String?
    var TIPOVEHICULO : String?
    var FOTO: String?
    var ROL: String?
    var AUTORIZADO : String?
    var RUT : String?
    var APELLIDOS: String?
    var NOMBRES: String?
    var EMPRESA: String?
    var PAIS: String?
}
