//
//  ViewController.swift
//  Todoey
//
//  Created by Nicolas Adas on 2019-09-22.
//  Copyright © 2019 Nicola Adas. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var itemList = ["To do item 1","To do item 2","To do item 3" ]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemList[indexPath.row])
    
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
  
   
    //MARK - Add New Item
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
   
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            if alert.textFields![0].text!.isEmpty == false {
                self.itemList.append(alert.textFields![0].text!)
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
        }

        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

