import Foundation

// Struct for storing data
struct Storage: Codable {
    let dailyEntriesArchiveURL: URL
    let activitiesArchiveURL: URL
    
    // Data error enums
    enum DataError: Error {
        case dataNotSaved
        case dataNotFound
    }
    
    init() {
        // Initiate .json data stores
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // Set up URL
        dailyEntriesArchiveURL = directory.appendingPathComponent("daily_entries")
            .appendingPathExtension("json")
        activitiesArchiveURL = directory.appendingPathComponent("activities")
            .appendingPathExtension("json")
    }
    
    // Read from file
    func read(from archive: URL) throws -> Data {
        if let data = try? Data(contentsOf: archive) {
            return data
        }
        throw DataError.dataNotFound
    }
    
    // Write to file
    func write(_ data: Data, to archive: URL) throws {
        do {
            try data.write(to: archive, options: .noFileProtection)
        }
        catch {
            throw DataError.dataNotSaved
        }
    }
    
    func loadDailyEntries() throws -> [DailyEntry] {
        let data = try read(from: dailyEntriesArchiveURL)
        if let dailyEntry = try? JSONDecoder().decode([DailyEntry].self, from: data) {
            return dailyEntry
        }
        throw DataError.dataNotFound
    }
    
    func saveDailyEntry(_ dailyEntry: [DailyEntry]) throws {
        let data = try JSONEncoder().encode(dailyEntry)
        try write(data, to: dailyEntriesArchiveURL)
    }
    
    func saveDailyEntry(_ dailyEntry: DailyEntry) throws {
        //let data = try JSONEncoder().encode(dailyEntry)
        //var allData = try loadDailyEntries()
        var allData: [DailyEntry] = []
        do {
            allData = try loadDailyEntries()
        } catch {
            
        }
        allData.append(dailyEntry)
        try saveDailyEntry(allData)
    }
    
    func loadActivities() throws -> [Activity] {
        let data = try read(from: activitiesArchiveURL)
        if let activity = try? JSONDecoder().decode([Activity].self, from: data) {
            return activity
        }
        throw DataError.dataNotFound
    }
    
    func saveActivities(_ activity: [Activity]) throws {
        let data = try JSONEncoder().encode(activity)
        try write(data, to: activitiesArchiveURL)
    }
    
    func saveActivities(_ activity: Activity) throws {
        var allData: [Activity] = []
        do {
            allData = try loadActivities()
        } catch {
            
        }
        allData.append(activity)
        try saveActivities(allData)
    }
}
