import UIKit
import Charts

class StatsViewController2: UIViewController {
    @IBOutlet weak var chtChart: LineChartView!
    @IBOutlet weak var chtBar: BarChartView!
    @IBOutlet weak var sevenEntriesButton: UIButton!
    @IBOutlet weak var thirtyEntriesButton: UIButton!
    @IBOutlet weak var allEntriesButton: UIButton!
    
    var dailyEntries: [DailyEntry] = []
    var ratings: [Double] = []
    var activitiesRatingsDict: [String: [Int]] = [:]; // activityName : ratings
    var entriesCount: Int = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Daily Entries from storage
        let storage = Storage()
        do {
            dailyEntries = try storage.loadDailyEntries()
        } catch {}
        
        loadRatings()
        //loadActivitiesRatings()
        updateGraph()
        //updateBarChart()
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
    
    func loadActivitiesRatings() {
        for i in 0..<dailyEntries.count {
            for j in 0..<dailyEntries[i].activityNames.count {
                let activityName = dailyEntries[i].activityNames[j]
                let endIndex = activitiesRatingsDict[activityName]?.endIndex
                activitiesRatingsDict[activityName]?.insert(dailyEntries[i].rating, at: endIndex!)
            }
        }
    }
    
    func updateBarChart() {
        var barChartEntries = [BarChartDataEntry]() //array that will eventually be displayed on the graph.
        var count: Int = 1
        for (name, ratings) in activitiesRatingsDict {
            let value = BarChartDataEntry(x: Double(count), y: Double(ratings.count)) // set the X and Y status in a data chart entry
            barChartEntries.append(value) // add to the data set
            count += 1
        }
        
        let set = BarChartDataSet(entries: barChartEntries, label: "Statistics Vienna 2014")
        set.drawIconsEnabled = false
        set.colors = [UIColor.red, UIColor.blue, UIColor.green]
        set.stackLabels = ["Births", "Divorces", "Marriages"]
        let data = BarChartData(dataSet: set)
        
        chtBar.fitBars = true
        chtBar.data = data
    }
    
    func updateGraph() {
        var lineChartEntries = [ChartDataEntry]() //array that will eventually be displayed on the graph.
        for i in 0..<ratings.count {
            let value = ChartDataEntry(x: Double(i), y: ratings[i]) // set the X and Y status in a data chart entry
            lineChartEntries.append(value) // add to the data set
        }
        
        let line1 = LineChartDataSet(entries: lineChartEntries, label: "Ratings") //Here we convert lineChartEntry to a LineChartDataSet
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
        entriesCount = 7
        loadRatings()
        updateGraph()
    }
    
    @IBAction func thirtyEntriesButtonPressed(_ sender: Any) {
        sevenEntriesButton.isSelected = false
        thirtyEntriesButton.isSelected = true
        allEntriesButton.isSelected = false
        entriesCount = 30
        loadRatings()
        updateGraph()
    }
    
    @IBAction func allEntriesButtonPressed(_ sender: Any) {
        sevenEntriesButton.isSelected = false
        thirtyEntriesButton.isSelected = false
        allEntriesButton.isSelected = true
        entriesCount = -1
        loadRatings()
        updateGraph()
    }
}
