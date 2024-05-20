//
//  MapInfoTableViewController.swift
//  mapAPI
//
//  Created by yoway Li on 2024/5/19.
//

import UIKit
import Kingfisher

class MapInfoTableViewController: UITableViewController {
    var mapInfoData: MapInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData { data in
            DispatchQueue.main.async {
                if let data = data {
                    // 使用 data 做其他處理
                    self.mapInfoData = data
                    self.tableView.reloadData() // 重新加載表格視圖
                } else {
                    // 處理數據加載失敗的情況
                    let alert = UIAlertController(title: "Error", message: "Failed to load data", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mapInfoData?.records.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapInfoTableViewCell", for: indexPath) as! MapInfoTableViewCell

        if let record = mapInfoData?.records[indexPath.row] {
            cell.mapName.text = record.fields.areaName
            cell.url = record.fields.areaInfo
            
            
            if let url = record.fields.areaImage.first?.url {
                cell.mapImage.kf.setImage(with: URL(string: url))
                
            }
        }
        return cell
    }

  /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
