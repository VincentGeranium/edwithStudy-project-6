//
//  MainTableViewCell.swift
//  UseOfNotificationCenter
//
//  Created by 김광준 on 2020/03/11.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellId = "MainTableViewCell"
    
    var mainImage: UIImage? {
        didSet {
            guard let getImage = mainImage else { return }
            mainImageView.image = getImage
        }
    }
    
    let mainImageView: UIImageView = {
        var mainImageView: UIImageView = UIImageView()
        return mainImageView
    }()
    
    let nameLabel: UILabel = {
        var nameLabel: UILabel = UILabel()
        return nameLabel
    }()
    
    let emailLabel: UILabel = {
        var emailLabel: UILabel = UILabel()
        return emailLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
