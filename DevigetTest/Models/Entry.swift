//
//  Entry.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import Foundation

struct Entry: Codable
{
    var kind: String
    var title: String
    var author: String
    var created: Double
    var thumbnail: String
    var numComments: Double

    enum CodingKeys: CodingKey {
        case kind, data
    }
    
    enum DataKeys: String, CodingKey {
        case title, author, created, thumbnail
        case numComments = "num_comments"
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(kind, forKey: .kind)

      var dataContainer = container
        .nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try dataContainer.encode(title, forKey: .title)
        try dataContainer.encode(author, forKey: .author)
        try dataContainer.encode(created, forKey: .created)
        try dataContainer.encode(thumbnail, forKey: .thumbnail)
        try dataContainer.encode(numComments, forKey: .numComments)
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      kind = try container.decode(String.self, forKey: .kind)

      let dataContainer = try container
        .nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        title = try dataContainer.decode(String.self, forKey: .title)
        author = try dataContainer.decode(String.self, forKey: .author)
        created = try dataContainer.decode(Double.self, forKey: .created)
        thumbnail = try dataContainer.decode(String.self, forKey: .thumbnail)
        numComments = try dataContainer.decode(Double.self, forKey: .numComments)
    }
}
