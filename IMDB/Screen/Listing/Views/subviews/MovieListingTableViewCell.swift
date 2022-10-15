//
//  MovieListingTableViewCell.swift
//  IMDB
//
//  Created by Abhishek kapoor on 15/10/22.
//

import UIKit

class MovieListingTableViewCell: UITableViewCell {
	
	@IBOutlet weak var headingLabel: UILabel!
	@IBOutlet weak var subHeadingLabel: UILabel!
	@IBOutlet weak var leadingImageView: UIImageView!
	
	private var movieDetails:MovieDetails?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		setupUI()
    }

	private func setupUI() {
		
		self.leadingImageView.round(with: .both)
		
		self.headingLabel.font = .boldSystemFont(ofSize: 18)
		self.headingLabel.textColor = .black
		
		self.subHeadingLabel.font = .systemFont(ofSize: 16)
		self.subHeadingLabel.textColor = .gray
		
	}
	
	
	
	public func configMovieListingTableViewCell(movieDetails:MovieDetails){
		self.setupUI()
		self.movieDetails = movieDetails
		self.leadingImageView.downloaded(from: movieDetails.posterPath)
		self.headingLabel.text = movieDetails.originalTitle
		self.subHeadingLabel.text = movieDetails.overview
	}

}
