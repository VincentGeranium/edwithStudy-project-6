//
//  ViewController.swift
//  asyncProgrammingUsedDispatchQueue
//
//  Created by 김광준 on 2020/02/19.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var mainTableView: UITableView = {
        var mainTableView: UITableView = UITableView()
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.mainTableViewCellId)
        return mainTableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

