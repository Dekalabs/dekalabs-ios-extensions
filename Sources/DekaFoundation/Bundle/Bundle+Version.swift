import Foundation

public extension Bundle {
    var releaseVersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
    }
    var buildVersionNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }
    var buildVersionNumberInt: Int {
        return Int(Bundle.main.buildVersionNumber) ?? 0
    }
    var releaseVersionNumberPretty: String {
        return "v\(releaseVersionNumber) (build \(buildVersionNumber))"
    }
}
