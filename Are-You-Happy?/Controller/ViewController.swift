import UIKit

class ViewController: UIViewController {
    
    // Variables
    var rating: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // TODO: Rename button actions
    @IBAction func happiestButtonPressed(_ sender: Any) {
        setRatingAndGoToActivities(1)
    }
    
    @IBAction func gourPressed(_ sender: Any) {
        setRatingAndGoToActivities(2)
    }
    
    @IBAction func threePressed(_ sender: Any) {
        setRatingAndGoToActivities(3)
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        setRatingAndGoToActivities(4)
    }
    
    @IBAction func onePressed(_ sender: Any) {
        setRatingAndGoToActivities(5)
    }
    
    func setRatingAndGoToActivities(_ rating: Int) {
        self.rating = rating
        performSegue(withIdentifier: "ActivitesViewSegue", sender: nil)
    }
}

