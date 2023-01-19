//
//  HomeService.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 19/01/23.
//

import UIKit
import Alamofire

class HomeService {
    
    func getHomeData(completion: @escaping (HomeData?, Error?) -> Void) {
        let url: String = "https://run.mocky.io/v3/dfd42f7e-ef40-4bc6-b3c6-e153e2d5a32f"
        
            AF.request(url, method: .get).validate().responseDecodable(of: HomeData.self) { response in
                
                debugPrint(response)
                
                switch response.result {
                case .success(let success):
                    completion(success, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
    func getHomeDataJson(completion: @escaping (HomeData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                completion(homeData, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
}
