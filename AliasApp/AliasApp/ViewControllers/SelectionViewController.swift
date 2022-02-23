
import Foundation
import UIKit


class SelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVerticalGradientLayer(topColor: .systemBlue, bottomColor: .cyan)
        
    }
    
    
    @IBAction func scienceButton(_ sender: UIButton) {
        print("You chose the category Science")
    }
    
    @IBAction func chemistryButton(_ sender: UIButton) {
        print("You chose the category Chemistry")
    }
    
    @IBAction func biologyButton(_ sender: UIButton) {
        print("You chose the category Biology")
    }
    
    @IBAction func physicsButton(_ sender: UIButton) {
        print("You chose the category Physics")
    }

}

//MARK: - Background

extension SelectionViewController {
    
    // Background Gradient
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

