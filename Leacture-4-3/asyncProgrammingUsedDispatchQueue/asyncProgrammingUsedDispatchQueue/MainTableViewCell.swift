//
//  MainTableViewCell.swift
//  asyncProgrammingUsedDispatchQueue
//
//  Created by 김광준 on 2020/02/19.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let mainTableViewCellId: String = "MainTableViewCell"
    
    var getImage: UIImage? {
        didSet {
            guard let mainImage = getImage else { return }
            mainImageView.image = mainImage
        }
    }
    
    
    fileprivate let mainImageView: UIImageView = {
        var mainImageView: UIImageView = UIImageView()
        mainImageView.image = UIImage()
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.clipsToBounds = true
        return mainImageView
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
        setImgViewConstraint()
        // Configure the view for the selected state
    }
    
    private func setImgViewConstraint() {
        contentView.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: 84),
        ])
    }

}
