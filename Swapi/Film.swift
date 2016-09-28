//
//  Film.swift
//  Swapi
//
//  Created by Florian Albrecht on 28.09.16.
//  Copyright © 2016 Florian Albrecht. All rights reserved.
//

import Foundation

struct Film {
    let title: String?
    let episodeID: Int?
    let openingCrawl: String?
    let director: String?
    let producer: String?
    let releaseDate: Date?
    let species: [String]?
    let starships: [String]?
    let vehicles: [String]?
    let characters: [String]?
    let planets: [String]?
    let url: String?
    let created: Date?
    let edited: Date?

    init?(json: [String: Any]) {
        self.title = json["title"] as? String
        self.episodeID = json["episode_id"] as? Int
        self.openingCrawl = json["opening_crawl"] as? String
        self.director = json["director"] as? String
        self.producer = json["producer"] as? String
        self.url = json["url"] as? String
        self.species = json["species"] as? [String]
        self.starships = json["starships"] as? [String]
        self.vehicles = json["vehicles"] as? [String]
        self.characters = json["characters"] as? [String]
        self.planets = json["planets"] as? [String]

        if let releaseDate = json["release_date"] as? String {
            self.releaseDate = DateFormatters.releaseDateFormatter.date(from: releaseDate)
        } else {
            self.releaseDate = nil
        }

        if let created = json["created"] as? String {
            self.created = DateFormatters.defaultFormatter.date(from: created)
        } else {
            self.created = nil
        }

        if let edited = json["edited"] as? String {
            self.edited = DateFormatters.defaultFormatter.date(from: edited)
        } else {
            self.edited = nil
        }
    }
}
