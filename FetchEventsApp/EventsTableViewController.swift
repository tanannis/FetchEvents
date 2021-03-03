//
//  EventsTableViewController.swift
//  FetchEventsApp
//
//  Created by Annis Tan on 3/2/21.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfEvents = [Event]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfEvents.count) Events found"
            }
        }
    }
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfEvents.count

    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)

        let event = listOfEvents[indexPath.row]

        cell.textLabel?.text = event.title
        cell.detailTextLabel?.text = event.datetimeUTC

        return cell
    }

}

extension EventsTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        guard let searchBarText = searchBar.text else {return}

        let eventRequest = EventRequest(CodingKeys: searchBarText)

        eventRequest.getEvents{ [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let events):
                self?.listOfEvents = events
            }
        }
    }
}


