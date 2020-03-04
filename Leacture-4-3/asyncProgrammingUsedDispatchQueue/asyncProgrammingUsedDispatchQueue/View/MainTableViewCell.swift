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
    
    var getNameInfo: String? {
          didSet {
              guard let mainLabelText = getNameInfo else { return }
              mainLabel.text = mainLabelText
          }
      }
    
    var getEmailInfo: String? {
           didSet {
               guard let subLabelText = getEmailInfo else { return }
               subLabel.text = subLabelText
           }
       }
    
    var mainImageView: UIImageView = {
        var mainImageView: UIImageView = UIImageView()
//        mainImageView.backgroundColor = .systemGray
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.clipsToBounds = true
        return mainImageView
    }()
    
    var mainLabel: UILabel = {
        var mainLabel: UILabel = UILabel()
//        mainLabel.backgroundColor = .systemBlue
        return mainLabel
    }()
    
    var subLabel: UILabel = {
        var subLabel: UILabel = UILabel()
//        subLabel.backgroundColor = .systemRed
        return subLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setImgViewConstraint()
        setupMainLabelConstraint()
        setupSubLabelConstraint()
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
    
    private func setupMainLabelConstraint() {
        contentView.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10),
            mainLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupSubLabelConstraint() {
        contentView.addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            subLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10),
            subLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            subLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

}
