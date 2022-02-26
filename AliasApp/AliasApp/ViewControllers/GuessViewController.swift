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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        timerStart()
        wordLabel.text = aliasBrain.updateWord(with: category)
        scoreLabel.text = String(score)
    }
    
    // MARK: - @IBActions
    @IBAction func answerPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            scoreLabel.text = String(aliasBrain.updateScore(title:title))
        }
        wordLabel.text = aliasBrain.updateWord(with: category)
    }
    
    //MARK: - Functions
    func timerStart() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if self.secondPassed <= 60 {
                progressBar.progress = Float(secondPassed) / Float(60)
                self.secondPassed += 1
            } else {
                Timer.invalidate()
            }
        }
    }
}
