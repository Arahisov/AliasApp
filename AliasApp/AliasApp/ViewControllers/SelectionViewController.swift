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
    //MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let destinationVC = segue.destination as! GuessViewController
            destinationVC.category = titleCategory
        }
    }
}

//MARK: - Background
extension SelectionViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}

