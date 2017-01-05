//
//  SongController.swift
//  PlaylistGuidedProject
//
//  Created by Steven Patterson on 6/29/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import Foundation


class SongController {
  
   static func addSongToPlaylist(songTitle: String, artist: String, playlist: Playlist ) {
    let _ = Song(songTitle: songTitle, artist: artist, playlist: playlist)
    PlaylistController.sharedPlaylistController.saveToPersistantStore()
    }
    
    static func deleteSong(song: Song) {
        if let moc = song.managedObjectContext {
            moc.deleteObject(song)
            PlaylistController.sharedPlaylistController.saveToPersistantStore()
        }
    }
}
