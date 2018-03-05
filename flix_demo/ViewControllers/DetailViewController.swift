//
//  DetailViewController.swift
//  flix_demo
//
//  Created by Elizabeth on 2/9/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let backdropPath =  "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    //var movie: [String: Any]?
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let movie = movie {
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overviewLabel
            backDropImageView.af_setImage(withURL: movie.backDropPathString!)
            posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
