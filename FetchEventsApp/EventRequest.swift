//
//  EventRequest.swift
//  FetchEventsApp
//
//  Created by Annis Tan on 3/2/21.
//

import Foundation


enum EventError:Error {
    case noDataAvailable
    case canNotProcessData
}

//curl https://api.seatgeek.com/2/events?client_id=MYCLIENTID

struct EventRequest {
    let resourceURL:URL
    let MYCLIENTID = "MjE1Njc0Njl8MTYxNDcwMTU3Ni4zNzc0NTE3"

    init(CodingKeys:String) {
        let resourceString = "https://api.seatgeek.com/2/events?client_id=\(MYCLIENTID)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }

    //API request
    func getEvents (completion: @escaping (Result<[Event], EventError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                print("NO DATA HERE!")
                return
            }
            do {
                let decoder = JSONDecoder()
                let eventsResponse = try decoder.decode(EventsResponse.self, from: jsonData)
                let events = eventsResponse.events
                print("EVENTS:\(events)")
                completion(.success(events))
            }
            catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}







