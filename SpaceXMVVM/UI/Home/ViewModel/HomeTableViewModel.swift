import Foundation

//MARK: - Protocol
protocol HomeTableViewModelProtocol{
    func missionSize() -> Int
    func missionIn(_ index: Int) -> Mission
    func handleTapRow(at index: Int)
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
    func handleTapRow(at index: Int) {
        self.viewDelegate?.navigateToDetails(mission: missionIn(index))
    }
    
    func missionSize() -> Int {
        self.missions.count
    }
    
    func missionIn(_ index: Int) -> Mission {
        self.missions[index]
    }
}
