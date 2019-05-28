import UIKit
import GameplayKit

class ActivitiesViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var activitiesScrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    
    // Load from HomeViewController
    var rating: Int?
    
    // Variables
    let randomSource: GKRandomSource = GKARC4RandomSource()
    var buttonArray: [UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let activites = 4 // TODO: Load activites list from storage.
        // Render activites based on user activity list
        for i in 0..<activites {
            let frame1 = CGRect(x: 20 + (i * 70), y: 20, width: 50, height: 50 )
            let button = UIButton(frame: frame1)
            button.backgroundColor = UIColor.gray
            buttonArray.append(button)
            button.tag = generateUniqueTag()
            button.addTarget(self, action: #selector(self.activityPressed(_:)), for: UIControl.Event.touchUpInside)
            // TODO: Need to wrap activy buttons in storyboard, maybe use a collection instead of ScrollView?
            self.activitiesScrollView.addSubview(button)
        }
    }
    
    // Activity pressed action for dynamic activities
    @objc func activityPressed( _ button : UIButton)
    {
        // TODO: Determine button activity type, add to a selectedActivies array
        if(button.backgroundColor == UIColor.gray) {
            button.backgroundColor = UIColor.brown
            nextButton.backgroundColor = UIColor.green
            nextButton.isEnabled = true
        } else {
            button.backgroundColor = UIColor.gray
            var isActive = false
            for i in 0..<buttonArray.count {
                if(buttonArray[i].backgroundColor != UIColor.gray) {
                    isActive = true
                    break;
                }
            }
            if(!isActive) {
                nextButton.backgroundColor = UIColor.gray
                nextButton.isEnabled = false
            }
            

        }
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
    
    // TODO: Override nextButton press, pass selected activites and rating to next screen
}
