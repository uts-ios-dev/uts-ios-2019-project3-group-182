import Foundation
import UIKit

class Activity: Codable {
    let name: String
    let active: Bool
    let image: String
    let color: Int

    //
    init( _ name: String, _ active: Bool, _ image: String, _ color: Int) {
        self.name = name
        self.active = active
        self.image = image
        self.color = color
    }    
}
