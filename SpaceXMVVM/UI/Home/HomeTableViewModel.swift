import Foundation

//MARK: - Protocol
protocol HomeTableViewModelProtocol{
    func handleViewDidLoad()
}

//MARK: - Class
final class HomeTableViewModel {
    private weak var viewDelegate: HomeTableViewControllerProtocol?
    private let missions: [Mission]
    
    init(
        viewDelegate: HomeTableViewControllerProtocol? = nil,
         missions: [Mission]
    ) {
        self.viewDelegate = viewDelegate
        self.missions = missions
    }
}

//MARK: - Extension
extension HomeTableViewModel: HomeTableViewModelProtocol {
    func handleViewDidLoad() {
        print(self.missions)
    }
}
