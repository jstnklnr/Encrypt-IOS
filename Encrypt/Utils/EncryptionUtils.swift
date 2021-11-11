//
//  EncryptionUtils.swift
//  Encrypt
//
//  Created by Justin Klaußnitzer on 11.11.21.
//

import Foundation
import CryptoKit

func sha256(text: String) -> String {
    return SHA256.hash(data: Data(text.utf8)).description
}
