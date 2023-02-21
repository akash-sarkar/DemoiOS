//
//  ArtistModelClass.swift
//  DemoInterview
//
//  Created by ST-MacBookpro on 21/02/23.
//
//track name, artist name, description, price and artwork image.
//
import Foundation

class ArtistModelClass: Codable {
    var results: [Results]
    class Results : Codable {
        var trackName: String?
        var artistName: String?
        var longDescription: String?
        var collectionPrice: Float?
        var artworkUrl60: String?
    }
}
