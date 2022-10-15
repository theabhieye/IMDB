//
//  extension UIImageView.swift
//  IMDB
//
//  Created by Abhishek kapoor on 15/10/22.
//

import UIKit

extension UIImageView {
	private func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
		contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
			else { return }
			DispatchQueue.main.async() { [weak self] in
				self?.image = image
			}
		}.resume()
	}
	
	func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
		let appendedURL = ApiConstantEnum.IMAGE_BASE_URL + link
		
		guard let url = URL(string: appendedURL) else { return }
		
		downloaded(from: url, contentMode: mode)
	}
}
