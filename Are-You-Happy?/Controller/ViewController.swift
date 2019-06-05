import UIKit

class ViewController: UIViewController {
    
    // Variables
    var rating: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Rating of 5 is sent to Rating function
    @IBAction func fiveButtonPressed(_ sender: Any) {
        setRatingAndGoToActivities(5)
    }
    // Rating of 4 is sent to Rating function
    @IBAction func fourPressed(_ sender: Any) {
        setRatingAndGoToActivities(4)
    }
    // Rating of 3 is sent to Rating function
    @IBAction func threePressed(_ sender: Any) {
        setRatingAndGoToActivities(3)
    }
    // Rating of 2 is sent to Rating function
    @IBAction func twoPressed(_ sender: Any) {
        setRatingAndGoToActivities(2)
    }
    // Rating of 1 is sent to Rating function
    @IBAction func onePressed(_ sender: Any) {
        setRatingAndGoToActivities(1)
    }
    // set Rating
    func setRatingAndGoToActivities(_ rating: Int) {
        self.rating = rating
        performSegue(withIdentifier: "ActivitesViewSegue", sender: nil)
    }
    // set ActivitiesViewController rating to current rating
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ActivitesViewSegue"){
            let activitiesVC = segue.destination as! ActivitiesViewController
            activitiesVC.rating = rating
        }
    }
    
    /*func checkTodaysEntry() {
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
    }*/
    
}

