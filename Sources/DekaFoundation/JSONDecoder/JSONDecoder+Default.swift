//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 04/11/2020.
//

import Foundation
import os.log

extension JSONDecoder {

    public static func `default`(decodeDateFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'",
                                 alternativeDecodeDateFormat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let rawDate = try container.decode(String.self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = decodeDateFormat
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC
            var date = dateFormatter.date(from: rawDate)

            if let date = date {
                return date
            } else {
                dateFormatter.dateFormat = alternativeDecodeDateFormat
                date = dateFormatter.date(from: rawDate)
                if let date = date {
                    return date
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Cannot decode date string \(rawDate)"
                    )
                }
            }
        })
        return jsonDecoder
    }
}
