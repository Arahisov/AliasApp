import UIKit

class RulesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: .systemBlue, bottomColor: .cyan)
    }
}

//MARK: - Background
extension RulesViewController {
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
