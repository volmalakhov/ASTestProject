//
//  PlaceListView.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

final class PlaceListView: UITableView {
    
    var onPlaceSelected: PlaceCoordinatesModel.Handler?
    
    private var items = [PlaceModel]()
    private let cellHeight: CGFloat = 80.0
    
    init() {
        super.init(frame: .zero, style: .grouped)
        registerCell()
        setSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaceListView {
    
    func append(_ items: [PlaceModel]) {
        self.items = items
    }
    
    func update() {
        reloadData()
    }
}

private extension PlaceListView {
    
    func registerCell() {
        register(PlaceListCell.self, forCellReuseIdentifier: PlaceListCell().reuseIdentifier)
    }
    
    func setSource() {
        delegate = self
        dataSource = self
    }
}

extension PlaceListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onPlaceSelected?(items[indexPath.row].coordinates)
    }
}

extension PlaceListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = makeCell(tableView, indexPath) else {
            return UITableViewCell()
        }
        cell.setData(items[indexPath.row])
        return cell
    }
}

private extension PlaceListView {
    
    func makeCell(_ tableView: UITableView, _ indexPath: IndexPath) -> PlaceListCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaceListCell().reuseIdentifier,
                                                                  for: indexPath) as? PlaceListCell else {
                                                                    return nil
        }
        return cell
    }
}
