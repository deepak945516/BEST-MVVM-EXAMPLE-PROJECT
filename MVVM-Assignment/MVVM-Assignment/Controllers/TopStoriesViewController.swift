//
//  ViewController.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 23/07/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var topStoriesTableView: UITableView!
    @IBOutlet weak var viewModel: ViewModel!

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialSetup()
        newsAPICall()
        layoutSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private Methods
    private func initialSetup() {
        // register the custom news table view cell
        self.topStoriesTableView.register(UINib.init(nibName: "TopStoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "TopStoriesTableViewCell")
    }

    private func newsAPICall() {
        viewModel.newsAPICallCompletion() {
            DispatchQueue.main.async {
                self.topStoriesTableView.reloadData()
                self.view.hideActivityIndicator()
            }
        }
    }

    private func layoutSetup() {
        self.view.showActivityIndicator()
        // sets height of table view cell automatically
        topStoriesTableView.estimatedRowHeight = 150
        topStoriesTableView.rowHeight = UITableViewAutomaticDimension
        // Set underlined navigation bar title Title
        let titleView = UILabel() // set other table properties
        let navTitle = NSAttributedString(string: "Top Stories  ", attributes:
            [.underlineStyle: NSUnderlineStyle.styleThick.rawValue, .underlineColor: viewModel.blueColor])
        titleView.attributedText = navTitle
        //set title view to navigation
        self.navigationItem.titleView = titleView
    }

    // MARK: - IBAction Methods
    @IBAction func newsTopicButtonTapped(_ sender: UIBarButtonItem) {

    }
}

// MARK: - Extension
// TABLEVIEW_DATA_SOURCE
extension TopStoriesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSectionsInTableView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let topStoriesCell = tableView.dequeueReusableCell(withIdentifier: "TopStoriesTableViewCell") as? TopStoriesTableViewCell else {
            return UITableViewCell()
        }
        topStoriesCell.configureNewsCell(newsData: viewModel.topNews![indexPath.row])
        return topStoriesCell
    }
}

// TABLE_VIEW_DELEGATE
extension TopStoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        if let detailNewsViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailNewsViewController") as? DetailNewsViewController {
            detailNewsViewController.detailNewsViewModel.detailNewsData = viewModel.topNews?[indexPath.row]
            navigationController?.pushViewController(detailNewsViewController, animated: true)
        }
    }
}

