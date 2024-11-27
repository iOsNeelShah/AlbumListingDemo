//
//  AlbumListTableViewCell.swift
//  AlbumDemoApp
//
//  Created by Neel on 11/27/24.
//

import SDWebImage
import UIKit


class AlbumListTableViewCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var lblTitle: UILabel = {
       let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var imgView: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        return img
    }()

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadView()
    }
    
    func loadView() {
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lblTitle)
        contentView.addSubview(imgView)
        
        NSLayoutConstraint.activate ([
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imgView.widthAnchor.constraint(equalToConstant: 50),
            imgView.heightAnchor.constraint(equalToConstant: 50),
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imgView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            lblTitle.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 10),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func setCellData(item: AlbumList) {
        lblTitle.text = item.title
        imgView.sd_setImage(with: URL(string: item.thumbnailUrl))
    }
}
