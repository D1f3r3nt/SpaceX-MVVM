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
        
        SpaceXCall().getMissions { [weak self] result in
            guard case .success(let missions) = result else {
                return
            }

            DispatchQueue.main.async {
                self?.viewDelegate?.navigateToHome(missions)
            }
        }
    }
}
