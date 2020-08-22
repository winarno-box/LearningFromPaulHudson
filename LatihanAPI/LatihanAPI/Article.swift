//
//  Article.swift
//  LatihanAPI
//
//  Created by agus winarno on 8/20/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import Foundation


struct Article:Codable{
    
    //var source:String?
    var author: String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
