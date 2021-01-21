//
//  FilmsCollectionViewController.swift
//  BlizzardPersonalApp
//
//  Created by Diego Monteagudo on 1/19/21.
//

import UIKit

private let reuseIdentifier = "Cell"
// un container
//initializer buscar acceso
class FilmsCollectionViewController: UICollectionViewController {
    var filmCollectionModel: FilmsCollectionViewModel = FilmsCollectionViewModel()
    var filmDataProvider: FilmsDataProvider = FilmsDataProvider()
    var cache = NSCache<NSString, UIImage>()
    var imgCollection = [UIImage]()
    var page = 1
   
    override func viewDidLoad() {
        super.viewDidLoad()
        filmCollectionModel.fetchData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.collectionView.reloadData()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 999
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmposter", for: indexPath) as! FilmPosterCollectionViewCell
        
        if filmCollectionModel.filmDataCollection.count > 0 {
            let posterPath = filmCollectionModel.filmDataCollection[indexPath.row].poster_path
            cell.imageView.setCustomImage(path: posterPath)
            
           
        // Configure the cell
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
        if indexPath.row == filmCollectionModel.filmDataCollection.count - 1  {  //numberofitem count
            page += 1
            updateData(page: page)
            
            }
    }
    
    func updateData(page: Int) {
        filmDataProvider.getFilmsData (page: page){ (response) in
            self.filmCollectionModel.filmDataCollection += response.results
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
