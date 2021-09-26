//
//  MockIKartItemClient.swift
//  IDriveKartTests
//
//  Created by Farooque Azam on 26/09/21.
//

import Foundation
@testable import IDriveKart


class MockIKartItemAPIClient{
    
    var shouldReturnError = false
    var isFetchingItemList = false
    
    func reset(){
        shouldReturnError = false
        isFetchingItemList = false
        
    }
    
    init(_ shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    convenience init(){
        self.init(false)
    }
    
    let mockItemListResponse : [[String : String]] = [
        [
            "id": "1",
            "name": "Chicken",
            "image": "http://placeimg.com/640/480",
            "description": "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
            "price": "391.00"
        ],
        [
            "id": "2",
            "name": "Bike",
            "image": "http://placeimg.com/640/480",
            "description": "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
            "price": "592.00"
        ]]
    
    
}

extension MockIKartItemAPIClient : IKartItemListHandlerProtol {
    
    func getAPiData<T>(requestURL: URL, resultType: T.Type, onCompletion: @escaping ServiceResponse) where T : Decodable {
        
        if shouldReturnError{
            onCompletion(T.self as! Decodable , "error")
        }else{
            let decoder = JSONDecoder()
            do {
                
                do {
                    let requestBody = try JSONEncoder().encode(mockItemListResponse)
                    let result = try decoder.decode([IKartItem].self, from: requestBody)
                    onCompletion(result , nil)
                }catch let error {
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }
}
