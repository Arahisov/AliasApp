import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello group 2")
    }
    @IBAction func rulesPressed(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        print(#function)
    }
}

