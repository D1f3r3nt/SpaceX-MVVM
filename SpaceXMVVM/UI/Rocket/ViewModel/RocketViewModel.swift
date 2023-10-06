import Foundation
import SafariServices

protocol RocketViewModelProtocol {
    func handleLoadData()
    func openWiki() -> SFSafariViewController?
}

final class RocketViewModel {
    private weak var viewDelegate: RocketViewControllerProtocol?
    private let rocket: Rocket
    
    init(
        viewDelegate: RocketViewControllerProtocol? = nil,
        rocket: Rocket
    ) {
        self.viewDelegate = viewDelegate
        self.rocket = rocket
    }
}

extension RocketViewModel: RocketViewModelProtocol {
    func handleLoadData() {
        self.viewDelegate?.updateView(with: self.rocket)
    }
    
    func openWiki() -> SFSafariViewController? {
        guard let wiki = self.rocket.wikipedia else {
            return nil
        }
        
        guard let url = URL(string: wiki) else {
            return nil
        }
        
        let safariaView = SFSafariViewController(url: url)
        return safariaView
    }
}
