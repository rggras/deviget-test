//
//  EntryViewCell.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import UIKit

class EntryViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var timeSinceCreated: UILabel!
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var comments: UILabel!

    var dataSource: EntryRepresentable? {
        didSet {
            setupUI()
        }
    }
    
    // MARK: Public Methods

    func setupUI() {
        guard let dataSource = dataSource else {
            return
        }
        
        title.text = dataSource.title
        author.text = dataSource.author
        timeSinceCreated.text = dataSource.timeSinceCreated
        comments.text = dataSource.comments
        
        // TODO: just doing this for test, ideally we should use an image cache
        if let url = URL(string: dataSource.thumbnail) {
            if let data = try? Data(contentsOf: url) {
                thumbnail.image = UIImage(data: data)
            }
        }
    }
}
