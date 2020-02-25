//
//  ViewController.swift
//  JsonParsingTut
//
//  Created by Renan Diniz on 25/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObject = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            do {
                var countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for country in countries {
                    print("\(country.name) : \(country.capital) : \(country.region)")
                }
            } catch {
                print("We got an error.")
        }
        }.resume()

    }
}

