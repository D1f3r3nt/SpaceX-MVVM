import UIKit

//MARK: - Protocol
protocol SplashViewControllerProtocol: AnyObject {
    func startLoading()
    func navigateToHome()
}

// MARK: - Class
class SplashViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.handleViewDidLoad()
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
        let homeController = HomeTableViewController()
        homeController.viewModel = HomeTableViewModel(viewDelegate: homeController)
        
        navigationController?.setViewControllers([homeController], animated: true)
    }
    
    
}
