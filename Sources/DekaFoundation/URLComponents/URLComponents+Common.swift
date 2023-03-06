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

    public static func url(scheme: String = "https", port: Int? = nil, host: String, path: String) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        if let port = port {
            components.port = port
        }

        guard let url = components.url else {
            os_log(.default, "No valid URL to: %@, %@, %@", scheme, host, path)
            return nil
        }
        return url
    }
}
