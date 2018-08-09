//
//  ProfileViewController.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 02/08/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak private var profileTableHeaderView: UIView!
    @IBOutlet weak private var profileTableView: UITableView!
    @IBOutlet weak private var userStoryView: UIView!
    @IBOutlet weak private var userStoryCollectionView: UICollectionView!

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileTableView.tableHeaderView = profileTableHeaderView
        self.navigationItem.title = String(stringLiteral: "Profile")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - TableView DataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            guard let imageView = cell.contentView.viewWithTag(100) as? UIImageView else { return cell }
            imageView.image = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "Wallpaper3") : #imageLiteral(resourceName: "Wallpaper1")
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableView Delegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return userStoryView
    }
}


// MARK: - Collection View DataSource

extension ProfileViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath)
        if let imageView = cell.contentView.viewWithTag(101) as? UIImageView {
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.masksToBounds = true
            imageView.image = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "Wallpaper1"): #imageLiteral(resourceName: "Wallpaper3")
        }
        return cell
    }
}

// MARK: -  CollectionView Delegate

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let fullStoryViewController = mainStoryboard.instantiateViewController(withIdentifier: "FullStoryViewController") as? FullStoryViewController {
            fullStoryViewController.storyImage = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "Wallpaper1"): #imageLiteral(resourceName: "Wallpaper3")
            self.navigationController?.pushViewController(fullStoryViewController, animated: true)
        }
    }
}
