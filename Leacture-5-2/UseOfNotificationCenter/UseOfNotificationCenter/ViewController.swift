//
//  ViewController.swift
//  UseOfNotificationCenter
//
//  Created by 김광준 on 2020/03/11.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainTableView: UITableView = {
        let mainTableView: UITableView = UITableView()
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.cellId)
        return mainTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellId, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}

