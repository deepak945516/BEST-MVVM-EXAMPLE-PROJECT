//
//  ViewModel.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 23/07/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

class ViewModel: NSObject {

    @IBOutlet var networkManager: NetworkManager!
    var topNews: [Results]?
    var blueColor: UIColor {
        return UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
    }

    func newsAPICallCompletion(completion: (() -> (Void))?) {
        networkManager.newsApiCall() { (result) in
            self.topNews = result!
            completion!()
        }
    }

    func numberOfSectionsInTableView() -> Int {
        return 1
    }
    func numberOfRowsInSection(section: Int) -> Int {
        return topNews?.count ?? 0
    }
}
