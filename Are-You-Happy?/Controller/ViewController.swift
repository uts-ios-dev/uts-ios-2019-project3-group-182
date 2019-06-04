import UIKit

class ViewController: UIViewController {
    
    // Variables
    var rating: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func veryHappyButton(_ sender: Any) {
        setRatingAndGoToActivities(1)
    }
    
    @IBAction func happyButton(_ sender: Any) {
        setRatingAndGoToActivities(2)
    }
    
    @IBAction func normalButton(_ sender: Any) {
        setRatingAndGoToActivities(3)
    }
    
    @IBAction func sadButton(_ sender: Any) {
        setRatingAndGoToActivities(4)
    }
    
    @IBAction func verySadButton(_ sender: Any) {
        setRatingAndGoToActivities(5)
    }
    
    func setRatingAndGoToActivities(_ rating: Int) {
        self.rating = rating
        performSegue(withIdentifier: "ActivitesViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ActivitesViewSegue"){
            let activitiesVC = segue.destination as! ActivitiesViewController
            activitiesVC.rating = rating
        }
    }
    
    func checkTodaysEntry() {
        let storage = Storage()
        var dailyEntries: [DailyEntry] = []
        do {
            dailyEntries = try storage.loadDailyEntries()
        } catch {}
        for i in 0..<dailyEntries.count {
            if (dailyEntries[i].date == getCurrentDate()) {
                performSegue(withIdentifier: "StatsViewSegue", sender: nil)
            }
        }
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
}

