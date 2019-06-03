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
    
    func getImage() -> String{
        return image
    }
    func getName() -> String{
        return name
    }
    func getActive() -> Bool{
        return active
    }
    func getcolor() -> Int{
        return color
    }
    
}
