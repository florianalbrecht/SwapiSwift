//
//  FilmDetailViewController.swift
//  Swapi
//
//  Created by Florian Albrecht on 28.09.16.
//  Copyright © 2016 Florian Albrecht. All rights reserved.
//

import UIKit

class FilmDetailViewController: UITableViewController {
    let film: Film

    init(film: Film) {
        self.film = film
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = film.title

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }

    // MARK - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 5
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Info"
        case 1:
            return "Opening Crawl"
        case 2:
            return "Links"
        default:
            return ""
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)

        if (cell == nil) {
            let style: UITableViewCellStyle = indexPath.section == 1 ? .default : .value1
            cell = UITableViewCell(style: style, reuseIdentifier: cellIdentifier)
        }

        cell?.accessoryType = indexPath.section == 2 ? .disclosureIndicator : .none

        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell?.textLabel?.text = "Director"
                cell?.detailTextLabel?.text = film.director
            case 1:
                cell?.textLabel?.text = "Producer"
                cell?.detailTextLabel?.text = film.producer
            case 2:
                cell?.textLabel?.text = "Release Date"
                if let releaseDate = film.releaseDate {
                    cell?.detailTextLabel?.text = DateFormatters.releaseDateFormatter.string(from: releaseDate)
                }
            default:
                ()
            }
        case 1:
            cell?.textLabel?.numberOfLines = 0
            cell?.textLabel?.text = film.openingCrawl
        case 2:
            switch indexPath.row {
            case 0:
                cell?.textLabel?.text = "Species"
                if let species = film.species {
                    cell?.detailTextLabel?.text = "\(species.count) Objects"
                }
            case 1:
                cell?.textLabel?.text = "Starships"
                if let starships = film.starships {
                    cell?.detailTextLabel?.text = "\(starships.count) Objects"
                }
            case 2:
                cell?.textLabel?.text = "Vehicles"
                if let vehicles = film.vehicles {
                    cell?.detailTextLabel?.text = "\(vehicles.count) Objects"
                }
            case 3:
                cell?.textLabel?.text = "Characters"
                if let characters = film.characters {
                    cell?.detailTextLabel?.text = "\(characters.count) Objects"
                }
            case 4:
                cell?.textLabel?.text = "Planets"
                if let planets = film.planets {
                    cell?.detailTextLabel?.text = "\(planets.count) Objects"
                }
            default:
                ()
            }
        default:
            ()
        }

        return cell!
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
