import Foundation
import UIKit

class Activity {
    let name: String
    let activte: Bool
    let image: String
    let color: UIColor

    
    init( _ name: String, _ active: Bool, _ image: String, _ color: UIColor) {
        self.name = name
        self.activte = active
        self.image = image
        self.color = color
    }
}
