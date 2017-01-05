//
//  PlaylistTableViewController.swift
//  PlaylistGuidedProject
//
//  Created by Steven Patterson on 6/29/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    var playlist: Playlist?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let playlist = playlist {
            self.title = playlist.title
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
   
    
    @IBAction func addPlaylistButtonTapped(sender: AnyObject) {
        
        if let text = nameTextField.text {
            PlaylistController.sharedPlaylistController.addPlaylist(text)
            self.tableView.reloadData()
        }
        
    }
    

    // MARK: - Table view data source

  
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedPlaylistController.playlists.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        let playlist = PlaylistController.sharedPlaylistController.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.title
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let playlist = PlaylistController.sharedPlaylistController.playlists[indexPath.row]
            PlaylistController.sharedPlaylistController.deletePlaylist(playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "toSongTableView" {
                if let showDetailViewController = segue.destinationViewController as? SongTableViewController, indexPath = tableView.indexPathForSelectedRow {
                    
                    let playlist = PlaylistController.sharedPlaylistController.playlists[indexPath.row]
                    showDetailViewController.playlist = playlist
                    
                
                }
            
            }
    }
  

}
