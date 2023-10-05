import UIKit
//MARK: - Protocol
protocol HomeTableViewControllerProtocol {
    
}

//MARK: - Class
class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeTableViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.handleViewDidLoad()
    }

    // Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }
}

//MARK: - Extension
extension HomeTableViewController: HomeTableViewControllerProtocol {
    
}
