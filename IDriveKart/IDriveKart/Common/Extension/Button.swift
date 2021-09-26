//
//  Button.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import UIKit

class Button: UIButton {
    
    typealias DidTapButton = (Button) -> ()
    
    var didTouchUpInside: DidTapButton? {
        didSet {
            if didTouchUpInside != nil {
                addTarget(self, action: #selector(didTouchUpInside(_:)), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(didTouchUpInside(_:)), for: .touchUpInside)
            }
        }
    }
    
    // MARK: - Actions
    
    @objc func didTouchUpInside(_ sender: UIButton) {
        if let handler = didTouchUpInside {
            handler(self)
        }
    }
}
