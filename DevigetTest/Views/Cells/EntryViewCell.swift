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
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var numComments: UILabel!

    // MARK: Public Methods

    func setup(for entry: Entry) {
        title.text = entry.title
        author.text = entry.author
        numComments.text = "\(entry.numComments) comments"
        
        // TODO: just doing this for test, ideally we should use an image cache
        if let url = URL(string: entry.thumbnail) {
            if let data = try? Data(contentsOf: url) {
                thumbnail.image = UIImage(data: data)
            }
        }
    }
}
