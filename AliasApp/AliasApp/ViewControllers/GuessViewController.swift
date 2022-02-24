import UIKit

class GuessViewController: UIViewController {
    
    @IBOutlet weak var worldLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var aliasBrain = AliasBrain()
    var score = 0
    var category = ""
   
    
    // MARK: - initial screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worldLabel.text = aliasBrain.updateWord(with: category)
        scoreLabel.text = String(score)
        
    }
    // MARK: - answer done
    @IBAction func answerPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            scoreLabel.text = String(aliasBrain.updateScore(title:title))
        }
        worldLabel.text = aliasBrain.updateWord(with: category)
    }
    
    
}
