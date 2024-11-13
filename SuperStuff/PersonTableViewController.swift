//
//  PersonTableViewController.swift
//  SuperStuff
//

import UIKit
import Foundation
import os

class PersonTableViewController: UITableViewController {
    
    private var people: [Person] {
        PeopleStore.people
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

        let person = people[indexPath.row]
        cell.textLabel?.text = person.login

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? PersonDetailViewController, let row = tableView.indexPathForSelectedRow?.row {
            detailViewController.person = people[row]
            detailViewController.imageFetcher = {
                guard let url = URL(string: detailViewController.person.avatarUrl) else { return }
                let task = URLSession.shared.dataTask(with: url)  { data, response, error in
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            detailViewController.image = image
                        }
                    }
                }
                task.resume()
            }
        }
    }

}
