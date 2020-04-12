//
//  VideoController.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 08/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class VideoController: UITableViewController, SideMenuItemContent {
    
    
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Vidéos"
        tableView.setup(color: HONEY_COLOR)
        APIHelper().getVideos { (vids) in
            DispatchQueue.main.async {
                self.videos = vids
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as? VideoCell {
            cell.setup(videos[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Passer par l'étape YouTube
//      let urlString = BASE_URL_VIDEO + videos[indexPath.row].id.videoId
        // Directement dans la lecture de la vidéo choisie
        let urlString = BASE_VIDEO_EMBED + videos[indexPath.row].id.videoId
        performSegue(withIdentifier: "YouTube", sender: urlString)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "YouTube" {
            if let controller = segue.destination as? WebController {
                controller.urlString = sender as? String
            }
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
    
}
