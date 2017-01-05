//
//  Playlist+CoreDataProperties.swift
//  PlaylistGuidedProject
//
//  Created by Steven Patterson on 7/7/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Playlist {

    @NSManaged var title: String
    @NSManaged var songs: NSOrderedSet

}
