//
//  Fetcher.swift
//  Beatport
//
//  Created by Richard Sbresny on 2/3/18.
//  Copyright © 2018 Richard Sbresny. All rights reserved.
//

import Foundation

class Fetcher {
  
  let sema = DispatchSemaphore(value: 0)
  
  func fetch() {
    for playlist in playlists {
      fetchPage(playlist: playlist)
    }
  }
  
  private func fetchPage(playlist: Playlist) {

    let task = URLSession.shared.dataTask(with: URL(string: playlist.url)!) { (data, response, error) -> Void in
      
      guard let data = data else {
        self.sema.signal()
        return
      }
      let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
      print(result)
      self.sema.signal()
    }
    task.resume()
    sema.wait()
  }
  
}
