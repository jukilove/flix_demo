//
//  SuperheroViewController.swift
//  flix_demo
//
//  Created by Elizabeth on 2/9/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //var movies: [[String: Any]] = []
    var movies: [Movie]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        fetchMovies()

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return movies.count
        if movies != nil {
            return movies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath)as! PosterCell
        
        cell.movie = movies[indexPath.row]
        
        return cell
        
    }
    
    func fetchMovies(){
        
        //Start activityIndicator
        //activityIndicator.startAnimating()
        MovieAPIManager().superheroMovies { (movies: [Movie]?, error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.movies = movies
                self.collectionView.reloadData()
            }
        }

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
