//
//  NewsFeed.swift
//  LatihanAPI
//
//  Created by agus winarno on 8/20/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import Foundation

struct NewsFeed : Codable {
    var status:String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
