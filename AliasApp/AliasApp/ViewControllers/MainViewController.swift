import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    let jokeMessage = JokeMessage()
    var jokeManager = JokeManager()
    var jokeContent = ""
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeManager.delegate = self
        jokeManager.fetchJoke()
    }
    
    //MARK: - @IBActions
    @IBAction func rulesPressed(_ sender: UIButton) {
        
    }
    @IBAction func playPressed(_ sender: UIButton) {
        
    }
    
    //MARK: - Functions
    private func showMessage() {
        jokeManager.fetchJoke()
        jokeMessage.showJokeAlert(from: jokeContent, to: self)
    }
}

//MARK: - JokeManagerDelegate
extension MainViewController: JokeManagerDelegate {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: JokeModel) {
        DispatchQueue.main.async {
            self.jokeContent = joke.jokeContent
        }
    }
}

