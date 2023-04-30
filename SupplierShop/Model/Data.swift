//
//  Discover.swift
//  SupplierShop
//
//  Created by Pro on 21.04.2023.
//

import Foundation

struct DataModel: Codable {
    var vendors: [Vendor]
}

struct Vendor: Codable, Identifiable {
    var id: Int
    var companyName, areaServed, shopType: String
    var favorited, follow: Bool
    var businessType: String
    var coverPhoto: CoverPhoto
    var categories: [Category]
    var tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case companyName = "company_name"
        case areaServed = "area_served"
        case shopType = "shop_type"
        case favorited, follow
        case businessType = "business_type"
        case coverPhoto = "cover_photo"
        case categories, tags
    }
}

struct CoverPhoto: Codable {
    var id: Int
    var mediaURL: String
    var mediaType: String

    enum CodingKeys: String, CodingKey {
        case id
        case mediaURL = "media_url"
        case mediaType = "media_type"
    }
}

enum MediaType: String, Codable {
    case image = "image"
}

struct Category: Codable {
    var id: Int
    var name: String
    var image: CoverPhoto
}

struct Tag: Codable {
    var id: Int
    var name, purpose: String
}
