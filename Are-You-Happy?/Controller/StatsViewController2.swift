import UIKit
import Charts

class StatsViewController2: UIViewController {
    @IBOutlet weak var chtChart: LineChartView!
    @IBOutlet weak var chtBar: BarChartView!
    @IBOutlet weak var sevenEntriesButton: UIButton!
    @IBOutlet weak var thirtyEntriesButton: UIButton!
    @IBOutlet weak var allEntriesButton: UIButton!
    
    var ratings: [Double] = []
    var entriesCount: Int = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRatings()
        updateGraph()
    }
    
    func loadRatings() {
        let storage = Storage()
        var dailyEntries: [DailyEntry] = []
        self.ratings = [] // reset ratings
        
        do {
            dailyEntries = try storage.loadDailyEntries()
        } catch {}
        
        var entriesToShow = dailyEntries.count
        if (self.entriesCount != -1 && entriesToShow > self.entriesCount) {
            entriesToShow = self.entriesCount
        }
        for i in (dailyEntries.count - entriesToShow)..<dailyEntries.count {
            self.ratings.append(Double(dailyEntries[i].rating))
        }
    }
    
    func updateGraph() {
        var lineChartEntry = [ChartDataEntry]() //array that will eventually be displayed on the graph.
        for i in 0..<self.ratings.count {
            let value = ChartDataEntry(x: Double(i), y: self.ratings[i]) // set the X and Y status in a data chart entry
            lineChartEntry.append(value) // add to the data set
        }
        
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Ratings") //Here we convert lineChartEntry to a LineChartDataSet
        line1.axisDependency = .left
        line1.colors = [UIColor(red: CGFloat(156 / 255.0), green: CGFloat(224 / 255.0), blue: CGFloat(107 / 255.0), alpha: 1.0)]
        line1.fillColor = UIColor(red: CGFloat(200 / 255.0), green: CGFloat(255 / 255.0), blue: CGFloat(158 / 255.0), alpha: 1.0)
        line1.drawCirclesEnabled = false
        line1.lineWidth = 4.0
        line1.circleRadius = 3.0
        line1.fillAlpha = 1.0
        line1.drawFilledEnabled = true
        line1.highlightColor = UIColor.red
        line1.drawCircleHoleEnabled = false
        line1.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.chtChart.leftAxis.axisMinimum)
        }
        let data = LineChartData()
        data.addDataSet(line1) //Add line to the dataSet
        chtChart.data = data //add chart data and cause an update
    }
    
    @IBAction func sevenEntriesButtonPressed(_ sender: Any) {
        sevenEntriesButton.isSelected = true
        thirtyEntriesButton.isSelected = false
        allEntriesButton.isSelected = false
        self.entriesCount = 7
        loadRatings()
        updateGraph()
    }
    
    @IBAction func thirtyEntriesButtonPressed(_ sender: Any) {
        sevenEntriesButton.isSelected = false
        thirtyEntriesButton.isSelected = true
        allEntriesButton.isSelected = false
        self.entriesCount = 30
        loadRatings()
        updateGraph()
    }
    
    @IBAction func allEntriesButtonPressed(_ sender: Any) {
        sevenEntriesButton.isSelected = false
        thirtyEntriesButton.isSelected = false
        allEntriesButton.isSelected = true
        self.entriesCount = -1
        loadRatings()
        updateGraph()
    }
}
