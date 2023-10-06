import UIKit
//MARK: - Protocol
protocol HomeTableViewControllerProtocol: AnyObject {
    func navigateToDetails(mission: Mission)
}

//MARK: - Class
class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeTableViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Cambiamos color de header
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.viewModel?.handleTapRow(at: indexPath.row)
    }
}

//MARK: - Extension
extension HomeTableViewController: HomeTableViewControllerProtocol {
    func navigateToDetails(mission: Mission) {
        let detailController = DetailsViewController()
        detailController.viewModel = DetaislViewModel(viewDelegate: detailController, mission: mission)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
