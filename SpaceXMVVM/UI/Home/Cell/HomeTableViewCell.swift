import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier: String = "HomeTableViewCell"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var successLabel: UILabel!
    
    override func prepareForReuse() {
        numberLabel.text = nil
        nameLabel.text = nil
        dateLabel.text = nil
        successLabel.text = nil
    }
    
    func configure(_ mission: Mission) {
        
        let formattedDate: String = String(mission.date.split(separator: "T")[0])
        
        numberLabel.text = "#\(mission.flightNumber)"
        nameLabel.text = mission.name
        dateLabel.text = formattedDate
        successLabel.text = mission.succes ? "Success" : "Failed"
    }
}
