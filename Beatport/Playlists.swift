//
//  Playlists.swift
//  Beatport
//
//  Created by Richard Sbresny on 2/3/18.
//  Copyright © 2018 Richard Sbresny. All rights reserved.
//

import Foundation

let playlists = [
  Playlist(url: "https://www.beatport.com/genre/future-house/65/top-100", top100: "2iuPopS62vaaJb5lV4sazy", full: "2SldPTryKVA6XlSi0akIqF")
]

struct Playlist {
  
  let url: String
  let top100: String
  let full: String
  
}
