import UIKit

//MARK: - Joke message
struct JokeMessage {
    func showJokeAlert(from text: String, to vc: UIViewController) {
        let ac = UIAlertController(title: "Ask the question:", message: text,  preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(okAction)
        vc.present(ac, animated: true, completion: nil)
    }
}
