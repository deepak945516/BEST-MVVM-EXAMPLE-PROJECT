//
//  TopStoriesTableViewCell.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 23/07/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit
import Kingfisher

class TopStoriesTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAbstractLabel: UILabel!

    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initialSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
//        self.contentView.backgroundColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 0.6)
    }

    // MARK: - Private Methods
    private func initialSetup() {
        cellBackgroundView.dropShadow(UIType: "cellBG", cornerRadius: 10, shadowOffset: CGSize(width: 0, height: -10), shadowRadius: 10)
    }

    func configureNewsCell(newsData: Results) {
//        DispatchQueue.global(qos: .default).async {
//            if let data = try? Data(contentsOf: URL(string: newsData.multimedia![0].url!)!){
//                DispatchQueue.main.async {
//                    self.newsImageView.image = UIImage(data: data)
//                }
//            }
//        }
        self.newsImageView.kf.setImage(with: URL(string: newsData.multimedia![0].url!)!)
        newsTitleLabel.text = newsData.title
        newsAbstractLabel.text = newsData.abstract
    }
}
