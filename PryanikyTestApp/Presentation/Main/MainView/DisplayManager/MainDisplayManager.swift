//
//  MainDisplayManager.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import UIKit

class MainDisplayManager: NSObject, UITableViewDelegate {
    var tableView: UITableView!
    var delegate: MainDisplayManagerDelegate?
    var pryanikObjects: [PryanikObject] = []
    {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
    }
}

extension MainDisplayManager: UITextViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.mainDisplayManager(self, didSelectPryanikObject: pryanikObjects[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pryanikObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as! MainTableViewCell
        let object = pryanikObjects[indexPath.row]
        cell.fill(with: object)
        return cell
    }
    
}
