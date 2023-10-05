import Foundation

//MARK: - Protocol
protocol HomeTableViewModelProtocol{
    func handleViewDidLoad()
}

//MARK: - Class
final class HomeTableViewModel {
    private weak var viewDelegate: HomeTableViewControllerProtocol?
    
    init(viewDelegate: HomeTableViewControllerProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
}

//MARK: - Extension
extension HomeTableViewModel: HomeTableViewModelProtocol {
    func handleViewDidLoad() {
    }
}
