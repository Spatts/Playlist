//
//  Song.swift
//  PlaylistGuidedProject
//
//  Created by Steven Patterson on 7/7/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import Foundation
import CoreData


class Song: NSManagedObject {

    convenience init?(songTitle: String, artist: String, playlist: Playlist,  context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName("Song", inManagedObjectContext: context) else {return nil}
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.songTitle = songTitle
        self.artist = artist
        self.playlist = playlist
        
    }

}
