//
//  LazyImageView.swift
//  RandomDogs
//
//  Created by Farooque Azam on 30/06/21.
//

import Foundation
import UIKit

class LazyImageView: UIImageView{

    func loadImage(fromURL imageURL: URL){
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
