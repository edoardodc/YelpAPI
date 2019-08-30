//
//  YelpBusiness.swift
//  API Yelp
//
//  Created by Edoardo de Cal on 22/01/2019.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import Foundation

struct Business: Decodable {
    let name: String
    let image_url: String
    let rating: Float
    let address1: String?
    let url: URL?
    let review_count: Int
    
}

struct YelpBusinesses: Decodable {
    let businesses: [Business]
}

