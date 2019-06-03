import UIKit
import GameplayKit

class ActivitiesViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var activitiesScrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    
    // Load from HomeViewController
    var rating: Int = 0
    
    // Variables
    let randomSource: GKRandomSource = GKARC4RandomSource()
    var buttonArray: [UIButton] = [UIButton]()
    var activities: [Activity] = []
    let activityNames: [String] = []
    let defaultFalseColor: UIColor = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let activites = 4 // TODO: Load activites list from storage.
        // Render activites based on user activity list
        let storage = Storage()
        do {
            activities = try storage.loadActivities()
        } catch {
            
        }
        for i in 0..<activities.count {
            let frame1 = CGRect(x: 20 + (i * 70), y: 20, width: 50, height: 50 )
            let imageName = activities[i].getImage()
            let image = UIImage(named: imageName)
            let button = UIButton(frame: frame1)
            button.setImage(image, for: .normal)
            button.tintColor = defaultFalseColor
            //button.backgroundColor = UIColor.gray
            buttonArray.append(button)
            button.tag = generateUniqueTag()
            button.addTarget(self, action: #selector(self.activityPressed(_:)), for: UIControl.Event.touchUpInside)
            // TODO: Need to wrap activy buttons in storyboard, maybe use a collection instead of ScrollView?
            self.activitiesScrollView.addSubview(button)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        addDataToStore()
    }
    
    // Activity pressed action for dynamic activities
    @objc func activityPressed( _ button : UIButton) {
        changeColor(button)
    }
    
    // Change and activate buttons
    func changeColor(_ button: UIButton) {
        if(button.tintColor == defaultFalseColor) {
            //button.backgroundColor = UIColor.brown
            button.tintColor = colors.uiColorOptions[activities[findButtonID(button)].getcolor()]
            nextButton.backgroundColor = UIColor.green
            nextButton.isEnabled = true
        } else {
            button.tintColor = defaultFalseColor
            if(!checkAnyActive()) {
                nextButton.backgroundColor = defaultFalseColor
                nextButton.isEnabled = false
            }
        }
    }
    func findButtonID(_ button: UIButton) -> Int{
        for i in 0..<buttonArray.count {
            if(buttonArray[i] == button) {
                return i
            }
        }
        return -1
    }
    // Check if any button is active
    func checkAnyActive() -> Bool{
        for i in 0..<buttonArray.count {
            if(buttonArray[i].tintColor != defaultFalseColor) {
                return true
            }
        }
        return false
    }
    
    // Generate and return a unique tag
    func generateUniqueTag() -> Int {
        // Loop until a valid tag is found
        while true {
            let tag = randomSource.nextInt(upperBound: 50) + 1
            guard let _ = self.view.viewWithTag(tag) else {
                return tag
            }
        }
    }
    
    func addDataToStore() {
        // TODO: store data
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
}
