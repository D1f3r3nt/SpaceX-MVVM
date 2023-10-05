import UIKit
//MARK: - Protocol
protocol HomeTableViewControllerProtocol: AnyObject {
    
}

//MARK: - Class
class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeTableViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.handleViewDidLoad()
        title = "Missions"
        
        self.tableView.register(
            UINib(nibName: "HomeTableViewCell", bundle: nil),
            forCellReuseIdentifier: HomeTableViewCell.identifier
        )
    }

    // Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel else {
            return 0
        }
        
        return viewModel.missionSize()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath
        ) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(viewModel.missionIn(indexPath.row))
        return cell
    }
}

//MARK: - Extension
extension HomeTableViewController: HomeTableViewControllerProtocol {
    
}
