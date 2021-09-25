//
//  APIClient.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation
import UIKit

typealias ServiceResponse = (_ T : Decodable , _ error : String?) -> Void

protocol  IKartItemListHandlerProtol {
    func getAPiData<T : Decodable>(requestURL : URL , resultType : T.Type  , onCompletion: @escaping ServiceResponse)
}

class APIClient {
    
    var baseURL: URL?
    
    static let shared = { APIClient(baseUrl: APIManager.shared.baseURL) }()
    
    required init(baseUrl: String){
        self.baseURL = URL(string: baseUrl)
    }
    private init(){}
}


extension APIClient : IKartItemListHandlerProtol {
    
    // MARK : - Service Layer Call To Get Data From Server
    
    func getAPiData<T : Decodable>(requestURL : URL , resultType : T.Type  , onCompletion: @escaping ServiceResponse) {
        URLSession.shared.dataTask(with: requestURL) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0){
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode([IKartItem].self, from: responseData!)
                    onCompletion(result , nil)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }
        .resume()
    }
}
