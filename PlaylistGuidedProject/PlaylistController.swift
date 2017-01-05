//
//  PlaylistController.swift
//  PlaylistGuidedProject
//
//  Created by Steven Patterson on 6/29/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    static let sharedPlaylistController = PlaylistController()
    
    var playlists: [Playlist] {
        let request = NSFetchRequest(entityName: "Playlist")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Playlist] ?? []
    }
    
    func addPlaylist(title: String) {
        let _ = Playlist(title: title)
    
    }
    
    func deletePlaylist(playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.deleteObject(playlist)
            saveToPersistantStore()
        }
    
    }
    
    func saveToPersistantStore() {
    let moc = Stack.sharedStack.managedObjectContext
        
        do {
            try moc.save()
        } catch {
            print ("There was a problem saving to the persistent store")
        }
    }
    
}
