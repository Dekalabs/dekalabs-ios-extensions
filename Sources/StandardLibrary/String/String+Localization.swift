//
//  String+Localization.swift
//  
//
//  Created by Ginés Navarro Fernández on 29/10/2020.
//

import Foundation

extension String {

    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
