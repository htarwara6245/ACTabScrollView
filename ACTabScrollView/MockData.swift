//
//  MockData.swift
//  ACTabScrollView
//
//  Created by Azure Chen on 5/21/16.
//  Copyright © 2016 AzureChen. All rights reserved.
//

import UIKit

class MockData {

    static let newsArray = [
        News(id: 1, category: .entertainment, title: "'Game of Thrones' Kit Harington on falling in love with co-star"),
        News(id: 2, category: .tech, title: "How Google plans to bring VR to our homes")
    ]
    
}

enum NewsCategory {
    case entertainment
    case tech
    case sport
    case all
    case travel
    case style
    case specials
    
    static func allValues() -> [NewsCategory] {
        return [.entertainment, .tech]
    }
}

struct News {
    let id: Int
    let category: NewsCategory
    let title: String
}
