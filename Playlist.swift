//
//  Playlist.swift
//  PlaylistGuidedProject
//
//  Created by Steven Patterson on 7/7/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import Foundation
import CoreData


class Playlist: NSManagedObject {
    

    convenience init?(title: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName("Playlist", inManagedObjectContext: context) else {return nil}
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.title = title

    }
}
