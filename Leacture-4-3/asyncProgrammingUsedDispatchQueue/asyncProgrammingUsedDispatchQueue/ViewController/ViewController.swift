//
//  ViewController.swift
//  asyncProgrammingUsedDispatchQueue
//
//  Created by 김광준 on 2020/02/19.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainTableView: UITableView = {
        var mainTableView: UITableView = UITableView()
        mainTableView.rowHeight = 50
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.mainTableViewCellId)
        return mainTableView
    }()
    
    var friends: [Friends] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        setupMainTableViewConstraint()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getData()
    }
    
    private func setupMainTableViewConstraint() {
        
        view.addSubview(mainTableView)
        
        let guide = self.view.safeAreaLayoutGuide
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
    }
    

    private func getData() {
        
        guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
                
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.mainTableViewCellId, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let friend: Friends = self.friends[indexPath.row]
        
        cell.getNameInfo = friend.name.full
        cell.getEmailInfo = friend.email
        cell.mainImageView.image = nil
        
//        cell.mainLabel.text = friend.name.full
//        cell.subLabel.text = friend.email
//        cell.mainImageView.image = nil
        
        /// Background 에서 실행
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            /// main thread 에서 실행
            DispatchQueue.main.async {
                if let index = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.getImage = UIImage(data: imageData)
//                        cell.mainImageView.image = UIImage(data: imageData)
                    }
                }
            }
        }
        return cell
    }
    
    
    
    
}

