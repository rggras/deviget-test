//
//  EntryViewModel.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import Foundation

class EntryViewModel: EntryRepresentable {
    
    var entry: Entry

    var title: String {
        return entry.title
    }

    var author: String {
        return entry.author
    }
    
    var timeSinceCreated: String {
        let date = Date(timeIntervalSince1970: entry.created)
        return date.timeAgo()
    }
    
    var thumbnail: String {
        return entry.thumbnail
    }
    
    var comments: String {
        return "\(entry.numComments) comments"
    }

    required init(entry: Entry) {
        self.entry = entry
    }
}
