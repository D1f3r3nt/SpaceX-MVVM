import Foundation
import SafariServices

protocol DetailsViewModelProtocol {
    func handleLoadData()
    func openVideo() -> SFSafariViewController?
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
    
    func openVideo() -> SFSafariViewController? {
        guard let video = self.mission.video else {
            return nil
        }
        
        guard let url = URL(string: video) else {
            return nil
        }
        
        let safariaView = SFSafariViewController(url: url)
        return safariaView
    }
}
