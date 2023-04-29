//
//  ViewController.swift
//  Mafia
//
//  Created by Максим Нурутдинов on 29.04.2023.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let tableView = UITableView()
    let tableViewArray = ["Мирный", "Мафия", "Коп", "Путана", "Доктор"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 10, y: 10, width: 350, height: 500)
        
    }

}

extension TableViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
}
