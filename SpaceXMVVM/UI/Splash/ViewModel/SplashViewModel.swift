import Foundation

//MARK: - Protocol
protocol SplashViewModelProtocol{
    func handleViewDidLoad()
}

//MARK: - Class
final class SplashViewModel {
    private weak var viewDelegate: SplashViewControllerProtocol?
    
    init(viewDelegate: SplashViewControllerProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
}

//MARK: - Extension
extension SplashViewModel: SplashViewModelProtocol {
    func handleViewDidLoad() {
        viewDelegate?.startLoading()
        
        // GET DATA - SpaceX
        
        viewDelegate?.navigateToHome()
    }
}
