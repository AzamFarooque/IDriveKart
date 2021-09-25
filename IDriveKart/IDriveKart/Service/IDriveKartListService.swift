//
//  APIService.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import UIKit


class IDriveKartListService {
    
    static let shared = { IDriveKartListService() }()
    typealias onCompletion = (Bool, String?) -> Void
    
    func getItemList(count: Int, success: @escaping (Int, [IKartItem]) -> (), failure: @escaping (Int) -> ()) {
        
      //  let urlString = URL(string : self.configureApiCall("", "count", "\(count)"))
        
//        APIClient.shared.getAPiData(requestURL: urlString, success: { (code, arrayOfQuotes) in
//            success(code, arrayOfQuotes)
//
//        }) { (code) in
//            failure(code)
//        }
        
        let urlString = URL(string : APIManager.shared.baseURL)
        
        
        APIClient.shared.getAPiData(requestURL: urlString!, resultType: IKartItem.self) { [weak self] (data, error) in
            if error == nil {
                success(1 , data as! [IKartItem])
            }else{
                
            }
        }
    }
    
    func configureApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
