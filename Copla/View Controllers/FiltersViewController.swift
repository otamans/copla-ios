//
//  FiltersViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/18/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var items: [FilterItem] = [FilterItem]()
    
    static let id: String = "FiltersViewControllerIdentifier"
    static func controller() -> FiltersViewController {
        return UIViewController.loadFrom(storyboard: storyboardName, id: id) as! FiltersViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items.append(FilterItem(title: "Услуги", isHeader: true, numbers: 0))
        self.items.append(FilterItem(title: "Все", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Предоставить", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Получить", isHeader: false, numbers: 0))

        self.items.append(FilterItem(title: "Тип", isHeader: true, numbers: 0))
        self.items.append(FilterItem(title: "Все", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Разовая", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Многократная", isHeader: false, numbers: 0))

        self.items.append(FilterItem(title: "Категории", isHeader: true, numbers: 0))
        self.items.append(FilterItem(title: "Все", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Волонтерство", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Образование", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Искусство", isHeader: false, numbers: 0))
        self.items.append(FilterItem(title: "Хозяйство", isHeader: false, numbers: 0))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let rightBarButtonItem = UIBarButtonItem(title: "Применить", style: .done, target: self, action: #selector(applyDidTapped(sender:)))
        rightBarButtonItem.tintColor = UIColor.actionBlue
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        let cellId = item.isHeader ? "headerCell" : "filterCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! FilterTableViewCell
        cell.setItem(item: item)
        
        return cell
    }
    
    @objc func applyDidTapped(sender: Any) {
        
    }
}
