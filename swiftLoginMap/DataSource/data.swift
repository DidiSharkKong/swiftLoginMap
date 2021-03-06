//
//  data.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import Foundation

let appartmentData:[AppartmentModel] = load("data.json")

// Read the data.json file and convert to AppartmentModel Array
func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error).")
    }
    
    do {
        let  decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error).")
    }
}
