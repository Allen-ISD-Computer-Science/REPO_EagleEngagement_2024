//
//  StringExtension.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

extension String {
    func base64Encode() -> String {
        let inputData = data(using: .utf8)
        let encodedData = inputData?.base64EncodedString()
        return encodedData ?? ""
    }
}
