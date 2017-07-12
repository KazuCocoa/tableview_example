import UIKit

struct Album {
    let title: String
    let artist: Artist
    init(title: String, artist: Artist) {
        self.title = title
        self.artist = artist
    }
}

struct Artist {
    let name: String
}

let beatles = Artist(name: "example")

let albums = [
    Album(title: "Please Please Me", artist: beatles),
    Album(title: "With The Beatles", artist: beatles),
    Album(title: "A Hard Day's Night", artist: beatles),
    Album(title: "Beatles For Sale", artist: beatles),
    Album(title: "Help!", artist: beatles),
    Album(title: "Rubber Soul", artist: beatles),
    Album(title: "Revolver", artist: beatles),
    Album(title: "Sgt. Pepper's Lonely Hearts Club Band", artist: beatles),
    Album(title: "The Beatles", artist: beatles),
    Album(title: "Yellow Submarine", artist: beatles),
    Album(title: "Abbey Road", artist: beatles),
    Album(title: "Let it be", artist: beatles),
]

// MARK: Table View

final class AlnumTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue

    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return albums.count
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
        cell.textLabel?.text = albums[indexPath.row].title
        cell.detailTextLabel?.text = albums[indexPath.row].artist.name

        return cell
    }
}

// MARK: Live View Configuration
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let viewController = AlnumTableViewController()
viewController.title = "Albums"
let navigationController = UINavigationController(rootViewController: viewController)
navigationController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = navigationController.view

