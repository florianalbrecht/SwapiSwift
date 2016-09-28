//
//  SwapiClient.swift
//  Swapi
//
//  Created by Florian Albrecht on 28.09.16.
//  Copyright © 2016 Florian Albrecht. All rights reserved.
//

import Foundation

class SwapiClient {
    let session = URLSession(configuration: URLSessionConfiguration.default)

    func films(completion: @escaping ([Film]) -> ()) {
        let request = URLRequest(url: URL(string: "http://swapi.co/api/films/")!)

        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            var films = [Film]()

            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let filmsArray = json?["results"] as? [[String: Any]] {

                for filmDict in filmsArray {
                    if let film = Film(json: filmDict) {
                        films.append(film)
                    }
                }
            }

            completion(films)
        }
        task.resume()
    }
}
