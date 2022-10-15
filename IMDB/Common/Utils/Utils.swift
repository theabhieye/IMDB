//
//  Utils.swift
//  IMDB
//
//  Created by Abhishek kapoor on 15/10/22.
//

import UIKit


class Util {
 
	static func readLocalFile(forName name: String) -> Data? {
		do {
			if let bundlePath = Bundle.main.path(forResource: name,
												 ofType: "json"),
			   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
				return jsonData
			}
		} catch {
			print(error)
		}
		
		return nil
	}
	
	static func getMovieData() -> [MovieDetails]? {
		guard let jsonData = Util.readLocalFile(forName: "MovieDetails") else { return  nil }
		do{
			let imdbData = try JSONDecoder().decode(ImdbModel.self, from: jsonData)
			return imdbData.results
		}
		catch {
			print(#function)
			print("Cannot convert to Model")
			return nil
		}

	}
}
