import UIKit
import Charts

class StatsViewController: UIViewController {
    @IBOutlet weak var chtChart: LineChartView!
    @IBOutlet weak var entriesButton1: UIButton!
    @IBOutlet weak var entriesButton2: UIButton!
    @IBOutlet weak var entriesButton3: UIButton!
    
    var dailyEntries: [DailyEntry] = []
    var ratings: [Double] = []
    var entriesCount: Int = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Daily Entries from storage
        let storage = Storage()
        do {
            dailyEntries = try storage.loadDailyEntries()
        } catch {}
        
        loadRatings()
        updateGraph()
    }
    
    func loadRatings() {
        ratings = [] // reset ratings
        
        var entriesToShow = dailyEntries.count
        if (entriesCount != -1 && entriesToShow > entriesCount) {
            entriesToShow = entriesCount
        }
        for i in (dailyEntries.count - entriesToShow)..<dailyEntries.count {
            ratings.append(Double(dailyEntries[i].rating))
        }
    }
    
    func updateGraph() {
        var lineChartEntries = [ChartDataEntry]() //array that will eventually be displayed on the graph.
        for i in 0..<ratings.count {
            let value = ChartDataEntry(x: Double(i), y: ratings[i]) // set the X and Y status in a data chart entry
            lineChartEntries.append(value) // add to the data set
        }
        
        let line1 = LineChartDataSet(entries: lineChartEntries, label: "Daily ratings") //Here we convert lineChartEntry to a LineChartDataSet
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
    
    @IBAction func entriesButton1Pressed(_ sender: Any) {
        entriesButton1.isSelected = true
        entriesButton2.isSelected = false
        entriesButton3.isSelected = false
        entriesCount = 7
        loadRatings()
        updateGraph()
    }
    @IBAction func entriesButton2Pressed(_ sender: Any) {
        entriesButton1.isSelected = false
        entriesButton2.isSelected = true
        entriesButton3.isSelected = false
        entriesCount = 30
        loadRatings()
        updateGraph()
    }
    @IBAction func entriesButton3Pressed(_ sender: Any) {
        entriesButton1.isSelected = false
        entriesButton2.isSelected = false
        entriesButton3.isSelected = true
        entriesCount = -1
        loadRatings()
        updateGraph()
    }
}
