import UIKit

class SelectionViewController: UIViewController {
    
    //MARK: - Properties
    var aliasBrain = AliasBrain()
    var titleCategory = ""
    var word = ""
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: .systemBlue, bottomColor: .cyan)
    }
    
    //MARK: - @IBActions
    @IBAction func categoryButtonPressed(_ sender: UIButton) {
        if let category = sender.titleLabel?.text {
            titleCategory = category
        }
        performSegue(withIdentifier: "toGame", sender: self)
    }
    
    //MARK: - Override Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let destinationVC = segue.destination as! GuessViewController
            destinationVC.category = titleCategory
        }
    }
}

