//
//  getSFSymbolExtension.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension UIImage {
    
    func getSfSymbolName() -> String {
        
        guard let strSeq = "\(String(describing: self))".split(separator: ")").first else { return "Not a SF Symbol" }
        let str = String(strSeq)
        guard let name = str.split(separator: ":").last else { return "Not a SF Symbol" }
        return String(name)
        
    }
    
}
