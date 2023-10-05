import UIKit

//MARK: - Protocol
protocol SplashViewControllerProtocol: AnyObject {
    func startLoading()
    func navigateToHome()
}

// MARK: - Class
class SplashViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Avisa que ha cargado
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        loadingIndicator.stopAnimating()
    }

}

// MARK: -Extension
extension SplashViewController: SplashViewControllerProtocol {
    func startLoading() {
        if !loadingIndicator.isAnimating {
            loadingIndicator.startAnimating()
        }
    }
    
    func navigateToHome() {
        //navigationController?.setViewControllers(, animated: true)
    }
    
    
}
