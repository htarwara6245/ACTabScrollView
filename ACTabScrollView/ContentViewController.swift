//
//  ContentViewController.swift
//  ACTabScrollView
//
//  Created by Azure Chen on 5/19/16.
//  Copyright © 2016 AzureChen. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var category: NewsCategory? {
        didSet {
            for news in MockData.newsArray {
                if (news.category == category || category == .all) {
                    newsArray.append(news)
                }
            }
        }
    }
    var newsArray: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = newsArray[(indexPath as NSIndexPath).row]
        
        // set the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ContentTableViewCell
        cell.thumbnailImageView.image = UIImage(named: "thumbnail-\(news.id)")
        cell.thumbnailImageView.layer.cornerRadius = 4
        cell.titleLabel.text = news.title
        cell.categoryLabel.text = String(describing: news.category)
        cell.categoryView.layer.backgroundColor = UIColor.white.cgColor
        cell.categoryView.layer.cornerRadius = 4
        cell.categoryView.layer.borderWidth = 1
        cell.categoryView.layer.borderColor = UIColor(red: 238.0 / 255, green: 238.0 / 255, blue: 238.0 / 255, alpha: 1.0).cgColor
        
        return cell
    }
}

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        self.selectionStyle = .none
    }
    
}
