//
//  Event.swift
//  FetchEventsApp
//
//  Created by Annis Tan on 3/2/21.
//

import Foundation

// MARK: - EventsResponse
struct EventsResponse: Codable {
    var events: [Event]
}

// MARK: - Event
struct Event: Codable {
    var title, type: String
    var venue: Venue
    var datetimeUTC: String
    var performers: [Performer]

    enum CodingKeys: String, CodingKey {
        case title, type, venue
        case datetimeUTC = "datetime_utc"
        case performers
    }
}

// MARK: - Performer
struct Performer: Codable {
    var imageAttribution: String

    enum CodingKeys: String, CodingKey {
        case imageAttribution = "image_attribution"
    }
}

// MARK: - Venue
struct Venue: Codable {
    var city: String
}
