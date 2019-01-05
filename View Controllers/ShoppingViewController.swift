//
//  ShoppingViewController.swift
//  Shopping List
//
//  Created by Piotr Sirek on 01/01/2019.
//  Copyright © 2019 Piotr Sirek. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    var shoppingList = ["Eggs 🥚", "Milk 🥛", "Cheese 🧀", "Carrots 🥕", "Potatos 🥔"]
    var buyedList = [String]()
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "shopping")
        
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
        addBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = addBarButtonItem
        view.addSubview(tableView)
    }
    
    @objc private func addProduct() {
        let alertController = UIAlertController(title: "Add product", message: "Type item which you want to buy!", preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter product..."
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            let textField = alertController.textFields![0]
            let newProduct = textField.text
            
            self.shoppingList.append(newProduct!)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) -> Void in
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return shoppingList.count
        case 1:
            return buyedList.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = shoppingList[indexPath.row]
        
        let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "shopping", for: indexPath)
        shoppingCell.textLabel?.text = product
        shoppingCell.detailTextLabel?.text = "4"
        return shoppingCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        if selectedCell?.accessoryType == .checkmark {
            selectedCell?.accessoryType = .none
        } else {
            selectedCell?.accessoryType = .checkmark
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            
            let deleteConfirmationAlert = UIAlertController(title: "Delete confirmation", message: "Are you sure to delete this item?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(alert) -> Void in
                self.shoppingList.remove(at: indexPath.row)
                tableView.reloadData()
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) -> Void in
            })
            
            deleteConfirmationAlert.addAction(deleteAction)
            deleteConfirmationAlert.addAction(cancelAction)
            
            self.present(deleteConfirmationAlert, animated: true)
        default:
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "You have \(shoppingList.count) products to buy"
        case 1:
            return "Buyed products"
        default:
            return "Undefined section!"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
