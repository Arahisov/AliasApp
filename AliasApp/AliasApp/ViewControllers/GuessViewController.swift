import UIKit

class GuessViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - Properties
    var secondPassed = 0
    var timer = Timer()
    var aliasBrain = AliasBrain()
    var score = 0
    var category = ""
    let jokeMessage = JokeMessage()
    var jokeManager = JokeManager()
    var jokeContent = ""
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeManager.delegate = self
        jokeManager.fetchJoke()
        timerStart()
        wordLabel.text = aliasBrain.updateWord(with: category)
        scoreLabel.text = String(score)
    }
    
    // MARK: - @IBActions
    
    
    
    @IBAction func answerDone(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            scoreLabel.text = String(aliasBrain.updateScore(title:title))
        }
        wordLabel.text = aliasBrain.updateWord(with: category)
        
        showMessage()
        timerRestart()
    }
    
    
    //MARK: - Private Functions
    private func timerStart() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if self.secondPassed <= 60 {
                progressBar.progress = Float(secondPassed) / Float(60)
                self.secondPassed += 1
            } else {
                Timer.invalidate()
                score = 0
                scoreLabel.text = "Счет: \(String(score))"
                wordLabel.text = aliasBrain.updateWord(with: category)
                timerRestart()
            }
        }
    }
    private func timerRestart() {
        timer.invalidate()
        progressBar.progress = 0
        secondPassed = 0
        timerStart()
    }
    private func showMessage() {
        jokeManager.fetchJoke()
        jokeMessage.showJokeAlert(from: jokeContent, to: self)
    }
}

//MARK: - JokeManagerDelegate
extension GuessViewController: JokeManagerDelegate {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: JokeModel) {
        DispatchQueue.main.async {
            self.jokeContent = joke.jokeContent
        }
    }
}
