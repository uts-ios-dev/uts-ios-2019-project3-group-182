import Foundation

// Struct for the Daily Entry
struct DailyEntry: Codable {
    var date: String
    var rating: Int
    var activityNames: [String]
}
