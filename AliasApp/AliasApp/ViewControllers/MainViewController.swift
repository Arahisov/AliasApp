import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    let joke = Joke()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - @IBActions
    @IBAction func rulesPressed(_ sender: UIButton) {
        showMessage()
    }
    @IBAction func playPressed(_ sender: UIButton) {
        showMessage()
    }
    
    //MARK: - Functions
    private func showMessage() {
        joke.showJokeAlert(to: self)
    }
}

