//
//  FullStoryViewController.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 03/08/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class FullStoryViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak private var fullStoryImageView: UIImageView!
    @IBOutlet weak private var storyProgressView: UIProgressView!
    var storyImage: UIImage?
    var time: Float = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        fullStoryImageView.image = storyImage
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        time = time + 1
        UIView.animate(withDuration: 2) {
            self.storyProgressView.setProgress((self.time / 9), animated: true)
        }
        if time > 10 {
            self.navigationController?.popViewController(animated: true)
        }
    }
}


