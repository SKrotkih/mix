import UIKit

class ViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var counterLabel: UILabel!
    
    private var state = AppState()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self)
    }

    func newState(state: State) {
        counterLabel.text = "\((state as? AppState)?.counter ?? 0)"
    }
    
    @IBAction func decrease(_ sender: Any) {
        store.dispatch(action: DecreaseAction(dencreaseBy: 1))
    }
    
    @IBAction func increase(_ sender: Any) {
        store.dispatch(action: IncreaseAction(increaseBy: 1))
    }
}
