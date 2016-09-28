//
//  ViewController.swift
//  Swapi
//
//  Created by Florian Albrecht on 28.09.16.
//  Copyright © 2016 Florian Albrecht. All rights reserved.
//

import UIKit

class FilmsViewController: UITableViewController {
    var films: [Film]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: UIImage(named: "logo"))
        navigationItem.titleView = imageView

        let client = SwapiClient()
        client.films { (films: [Film]) in
            self.films = films
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as UITableViewCell?

        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }

        let film = films![indexPath.row]
        cell?.textLabel?.text = film.title

        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = films![indexPath.row]
        let detailViewController = FilmDetailViewController(film: film)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
