//
//  NewTableViewController.swift
//  Lab6_TableView
//
//  Created by user237042 on 2/19/24.
//

import UIKit

class NewTableViewController: UITableViewController {
    var cities = ["Kitchener", "Waterloo", "Calgary", "Toronto", "Brampton", "Cambridge", "Montreal", "Ottawa", "Victoria"]
    
    @IBAction func buttonAdd(_ sender: UIButton) {
        // Create an alert controller
        let alert = UIAlertController(title: "City Name", message: "Please provide some city name", preferredStyle: .alert)
        
        // Add a text field to the alert
        alert.addTextField { textField in
            textField.placeholder = "Enter a city name"
        }
        
        // Add "OK" action
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] _ in
            let textField = alert?.textFields?.first
            if let newCity = textField?.text, !newCity.isEmpty {
                // Add the car brand to the array
                self.cities.append(newCity)
                
                // Update the table view
                self.myTableView.beginUpdates()
                self.myTableView.insertRows(at: [IndexPath(row: self.cities.count-1, section: 0)], with: .automatic)
                self.myTableView.endUpdates()
            }
        }))
        
        // Add "Cancel" action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet var myTableView: UITableView!
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)

        cell.textLabel?.text = cities[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cities.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    //MARK: Add delete button at left
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
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

}
