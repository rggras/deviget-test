//
//  Entries.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import Foundation

struct Entries: Codable
{
    var kind: String
    var childrens: [Entry]

    enum CodingKeys: CodingKey {
        case kind, data
    }
    
    enum DataKeys: String, CodingKey {
        case childrens = "children"
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(kind, forKey: .kind)

      var dataContainer = container
        .nestedContainer(keyedBy: DataKeys.self, forKey: .data)
      try dataContainer.encode(childrens, forKey: .childrens)
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      kind = try container.decode(String.self, forKey: .kind)

      let dataContainer = try container
        .nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        childrens = try dataContainer.decode([Entry].self, forKey: .childrens)
    }
}
