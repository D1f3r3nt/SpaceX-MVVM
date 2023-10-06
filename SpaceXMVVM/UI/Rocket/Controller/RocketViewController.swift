import UIKit

protocol RocketViewControllerProtocol: AnyObject {
    func updateView(with rocket: Rocket)
}

class RocketViewController: UIViewController {
    
    private let defaultImage: String = "https://media.wired.com/photos/5c51f0d269e9f52cf8abf291/master/w_1600%2Cc_limit/Spaceflight_Carve.png"

    @IBOutlet weak var imageRocket: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var engineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var viewModel: RocketViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.handleLoadData()
    }

    @IBAction func didTapMoreInfo(_ sender: Any) {
        guard let safari = self.viewModel?.openWiki() else {
            return
        }
        
        present(safari, animated: true, completion: nil)
    }
}

extension RocketViewController: RocketViewControllerProtocol {
    func updateView(with rocket: Rocket) {
        imageRocket.setImage(for: URL(string: rocket.image ?? defaultImage)!)
        nameLabel.text = rocket.name
        title = rocket.name
        activeLabel.text = rocket.active ? "Active" : "Inactive"
        activeLabel.textColor = rocket.active ? .green : .red
        infoButton.isHidden = rocket.wikipedia == nil
        heightLabel.text = "\(rocket.height) m"
        massLabel.text = "\(rocket.mass) kg"
        engineLabel.text = rocket.engine
        descriptionLabel.text = rocket.description
    }
    
    
}
