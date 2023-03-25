//
//  getSFSymbolExtension.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension UIImage {

 var sfSymbolName: String? {
        guard let strSeq = "\(String(describing: self))".split(separator: ")").first else { return nil }
        let str = String(strSeq)
        guard let name = str.split(separator: ":").last else { return nil }
        return String(name)
    }
}
