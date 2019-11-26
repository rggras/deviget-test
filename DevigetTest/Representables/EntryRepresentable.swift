//
//  EntryRepresentable.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

protocol EntryRepresentable {
    var title: String { get }
    var author: String { get }
    var timeSinceCreated: String { get }
    var thumbnail: String { get }
    var comments: String { get }
}
