import UIKit

class GuessViewController: UIViewController {
    
    //MARK: - Properties
    var secondPassed = 0
    var timer = Timer()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        timerStart()
    }
    
    //MARK: - @IBOutlet
    @IBOutlet weak var progressBar: UIProgressView!

//MARK: - Function 
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
