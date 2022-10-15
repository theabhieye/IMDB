//
//  ListingViewController.swift
//  IMDB
//
//  Created by Abhishek kapoor on 15/10/22.
//

import UIKit

final class ListingViewController: UIViewController {
	
	@IBOutlet weak var movieDetailTableView: UITableView!
	var movieData: [MovieDetails]?
	let listingListing = "MovieListingTableViewCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = .white
		let listingTableViewCellNIB = UINib(nibName: listingListing, bundle: nil)
		self.movieDetailTableView.register(listingTableViewCellNIB, forCellReuseIdentifier: listingListing)
		
		self.movieData = Util.getMovieData()
		movieDetailTableView.separatorStyle = .none
 	}
}

extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movieData?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: listingListing, for: indexPath) as? MovieListingTableViewCell else {
			return UITableViewCell()
		}
		if let item = movieData?[indexPath.row] {
			cell.configMovieListingTableViewCell(movieDetails: item)
		}
		
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard let item = movieData?[indexPath.row] else { return  }
		let movieDetailVC = MovieDetailsViewController.newInstance(movieDatails: item)
		self.navigationController?.pushViewController(movieDetailVC, animated: true)
	}
	
}
