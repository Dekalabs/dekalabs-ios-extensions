//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 04/11/2020.
//

import Foundation
import os.log

extension URLComponents {
    public static func urlWith(scheme: String = "https", port: Int? = nil, host: String, path: String) -> String {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        if let port = port {
            components.port = port
        }
        
        if let url = components.string {
            return url
        } else {
            os_log(.default, "No valid URL to: %@, %@, %@", scheme, host, path)
            return ""
        }
    }
}
