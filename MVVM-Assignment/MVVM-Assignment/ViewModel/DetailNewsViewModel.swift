//
//  DetailNewsViewModel.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 24/07/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import Foundation

class DetaiNewsViewModel: NSObject {
    var detailNewsData: Results?
    var detailNewsImageUrlString: String {
        return detailNewsData?.multimedia![2].url ?? "Opps Sorry, No Data Found"
    }
    var detailNewsAbstract: String {
        return detailNewsData?.abstract ?? "Opps Sorry, No Data Found"
    }
    var detailNewsPhotoCaption: String {
        return detailNewsData?.multimedia![0].caption ?? "Opps Sorry, No Data Found"
    }
}
