import Foundation

protocol DetailsViewModelProtocol {
    func handleLoadData()
}

final class DetaislViewModel {
    private weak var viewDelegate: DetailsViewControllerProtocol?
    private let mission: Mission
    
    init(
        viewDelegate: DetailsViewControllerProtocol? = nil,
        mission: Mission
    ) {
        self.viewDelegate = viewDelegate
        self.mission = mission
    }
}

extension DetaislViewModel: DetailsViewModelProtocol {
    func handleLoadData() {
        self.viewDelegate?.updateValues(with: mission)
    }
}
