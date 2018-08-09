//
//  DetailNewsViewController.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 23/07/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class DetailNewsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var newsPhotoBackgroundView: UIView!
    @IBOutlet weak private var newsImageView: UIImageView!
    @IBOutlet weak private var newsAbstractLabel: UILabel!
    @IBOutlet weak private var newsCaptionLabel: UILabel!
    @IBOutlet weak var detailNewsViewModel: DetaiNewsViewModel!

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private Methods
    private func initialSetup() {
        newsImageView.dropShadow(UIType: "UIImageView", cornerRadius: 10, shadowOffset: CGSize(width: 0, height: 0), shadowRadius: 10)
        // Set Data
        //        if let data = try? Data(contentsOf: URL(string: self.detailNewsViewModel.detailNewsImageUrlString)!) {
        //            self.newsImageView.image = UIImage(data: data)
        //            self.view.hideActivityIndicator()
        //        }
        self.newsImageView.kf.setImage(with: URL(string: self.detailNewsViewModel.detailNewsImageUrlString)!)
        newsAbstractLabel.text = self.detailNewsViewModel.detailNewsAbstract
        newsCaptionLabel.text = self.detailNewsViewModel.detailNewsPhotoCaption
    }
}
