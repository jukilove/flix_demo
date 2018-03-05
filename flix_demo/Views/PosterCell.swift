//
//  PosterCell.swift
//  flix_demo
//
//  Created by Elizabeth on 2/9/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit
import AlamofireImage

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }
}
