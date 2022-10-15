//
//  MovieDetailsViewController.swift
//  IMDB
//
//  Created by Abhishek kapoor on 15/10/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
	
	
	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var releaseDateLabel:UILabel!
	@IBOutlet weak var ratingLabel:UILabel!
	@IBOutlet weak var popularityLabel:UILabel!
	@IBOutlet weak var overviewLabel:UILabel!
	
	var movieDatails:MovieDetails?

	static func newInstance(movieDatails:MovieDetails?) -> MovieDetailsViewController {
		let mainStoryBoard = UIStoryboard(name: "MovieDetailsViewController", bundle: nil)
		let vc = mainStoryBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
		vc.movieDatails = movieDatails
		return vc
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.posterImage.downloaded(from: movieDatails?.posterPath ?? "")
		self.posterImage.round(with: .both)
		self.releaseDateLabel.text = movieDatails?.releaseDate
		self.ratingLabel.text = "\(movieDatails?.voteAverage ?? 0.0)"
		self.overviewLabel.text = movieDatails?.overview
		self.overviewLabel.numberOfLines = 0
		self.releaseDateLabel.text = movieDatails?.releaseDate
		self.popularityLabel.text = "\(movieDatails?.popularity ?? 0.0)"
	}
    
}
