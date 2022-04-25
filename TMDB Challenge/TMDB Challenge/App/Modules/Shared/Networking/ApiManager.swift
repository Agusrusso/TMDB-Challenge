//
//  ApiManager.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()

    // GET / POST / DELETE / UPDATE
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
}
