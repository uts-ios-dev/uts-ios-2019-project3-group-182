import UIKit

class StatsViewController: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var test: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Get logs from store
        // TODO: Render daily activities in graph
        let storage = Storage()
        var dailyEntries: [DailyEntry] = []
        do {
            //dailyEntries = try storage.loadDailyEntries()
        } catch {}
        let frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        for i in 0..<dailyEntries.count {
            
            let date = dailyEntries[i].date
            let rating = dailyEntries[i].rating
            let activityNames = dailyEntries[i].activityNames
            
            
            let dateLabel = UILabel(frame: frame )
            dateLabel.text = date
            
            
            
            self.scrollview.addSubview(dateLabel)
            
        }
        let testLabel = UILabel(frame: frame)
        testLabel.text = "\(dailyEntries.count)"
        self.scrollview.addSubview(testLabel)
        test.text = "testinnnngs"
        
    }
}
