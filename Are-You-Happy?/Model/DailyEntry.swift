import Foundation

// Struct for the Daily Entry
struct DailyEntry: Codable {
    var date: Date
    var rating: Int
    var activityNames: [String]
}
