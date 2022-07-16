
import Foundation

extension URL {

    var filename: String {
        var filename = lastPathComponent
        let extensionLength = pathExtension.count
        if extensionLength > 0 {
            filename.removeLast(extensionLength + 1)
        }
        return filename
    }
}
