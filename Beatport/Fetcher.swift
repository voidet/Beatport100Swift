//
//  Fetcher.swift
//  Beatport
//
//  Created by Richard Sbresny on 2/3/18.
//  Copyright © 2018 Richard Sbresny. All rights reserved.
//

import Foundation
import SwiftSoup

class Fetcher {
  
  let sema = DispatchSemaphore(value: 0)
  
  func fetch() {
    for playlist in playlists {
      fetchPage(playlist: playlist, htmlResponse: { doc in
        
      })
    }
  }
  
  private func fetchPage(playlist: Playlist, htmlResponse: @escaping (Document) -> Void) {

   URLSession.shared.dataTask(with: URL(string: playlist.url)!) { (data, response, error) -> Void in
      
      if let data = data {
        let html = String(data: data, encoding: String.Encoding.utf8)!
        if let doc: Document = try? SwiftSoup.parse(html) {
          htmlResponse(doc)
        }
      }
      
      self.sema.signal()
    }.resume()

    sema.wait()
  }
  
}
