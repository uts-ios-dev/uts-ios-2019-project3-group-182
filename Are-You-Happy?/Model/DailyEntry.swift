import Foundation

class DailyEntry {
    let date: Date
    let rating: Int
    let activities: [Activity]
    
    init(date: Date, rating: Int, activities: [Activity]) {
        self.date = date
        self.rating = rating
        self.activities = activities
    }
}
