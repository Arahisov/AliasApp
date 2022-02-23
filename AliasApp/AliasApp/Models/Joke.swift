import UIKit

//MARK: - Joke message
struct Joke {
    func showJokeAlert(to vc: UIViewController) {
        let ac = UIAlertController(title: "Here must be Joke ;-)", message: "Do you like it?)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(okAction)
        vc.present(ac, animated: true, completion: nil)
    }
}
