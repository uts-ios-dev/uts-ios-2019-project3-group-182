import Foundation

// Struct for the Daily Entry
class DailyEntry: Codable {
    let date: String
    let rating: Int
    let activityNames: [String]
    
    init( _ date: String, _ rating: Int, _ activityNames: [String]) {
        self.date = date
        self.rating = rating
        self.activityNames = activityNames
    }
    
}
