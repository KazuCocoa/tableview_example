import UIKit

struct Acknowledgement {
    let title: String
    let description: String
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

let acknowledgements = [
    Acknowledgement(title: "Please Please Me", description: "MIT"),
    Acknowledgement(title: "With The Beatles", description: "MIT"),
    Acknowledgement(title: "A Hard Day's Night", description: "MIT"),
    Acknowledgement(title: "Beatles For Sale", description: "MIT"),
    Acknowledgement(title: "Help!", description: "MIT"),
    Acknowledgement(title: "Rubber Soul", description: "MIT"),
    Acknowledgement(title: "Revolver", description: "MIT"),
    Acknowledgement(title: "Sgt. Pepper's Lonely Hearts Club Band", description: "MIT"),
    Acknowledgement(title: "The Beatles", description: "MIT"),
    Acknowledgement(title: "Yellow Submarine", description: "MIT"),
    Acknowledgement(title: "Abbey Road", description: "MIT"),
    Acknowledgement(title: "Let it be", description: "MIT"),
]

// MARK: Table View

final class AcknowledgementsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return acknowledgements.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = acknowledgements[indexPath.row].title
        cell.detailTextLabel?.text = acknowledgements[indexPath.row].description

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        acknowledgements[indexPath.item].title

        AcknowledgementsDetailViewController()
    }
}

// MARK: UIView
final class AcknowledgementsDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
    }
}

// MARK: Live View Configuration
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let viewController = AcknowledgementsViewController()
viewController.title = "Acknowledgements"
let navigationController = UINavigationController(rootViewController: viewController)
navigationController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = navigationController.view

