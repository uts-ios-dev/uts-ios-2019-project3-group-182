import Foundation
import UIKit

class Activity: Codable {
    let name: String
    let activte: Bool
    let image: String
    let color: String

    
    init( _ name: String, _ active: Bool, _ image: String, _ color: String) {
        self.name = name
        self.activte = active
        self.image = image
        self.color = color
    }
}
