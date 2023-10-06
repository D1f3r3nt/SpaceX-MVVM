import Foundation
import SafariServices

protocol DetailsViewModelProtocol {
    func handleLoadData()
    func openVideo() -> SFSafariViewController?
    func handleLoadRocket()
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
    func handleLoadRocket() {
        guard let rocket = mission.rocketId else {
            return
        }
        
        SpaceXCall().getRocket(rocketId: rocket) { [weak self] result in
            guard case .success(let rocket) = result else {
                return
            }

            DispatchQueue.main.async {
                self?.viewDelegate?.navigateToRocket(with: rocket)
            }
        }
    }
    
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
