import Foundation

//MARK: - Protocol
protocol HomeTableViewModelProtocol{
    func handleViewDidLoad()
    func missionSize() -> Int
    func missionIn(_ index: Int) -> Mission
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
    func missionSize() -> Int {
        self.missions.count
    }
    
    func missionIn(_ index: Int) -> Mission {
        self.missions[index]
    }
    
    func handleViewDidLoad() {
    }
}
