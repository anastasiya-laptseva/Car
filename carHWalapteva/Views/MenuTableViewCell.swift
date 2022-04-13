//
//  MenuTableViewCell.swift
//  carHWalapteva
//
//  Created by Anastasiya Laptseva on 29.03.22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let reuseID = "MenuTableViewCell"
    
//    private var solidColorView = UIView(frame: .zero)
    
    let solidColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "кастомный текст"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(solidColorView)
        addSubview(iconImageView)
        addSubview(myLabel)
        
        backgroundColor = .clear
        
        //iconImageView constraints
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        // добавить констрэинты под solidColorView
        solidColorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        solidColorView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        solidColorView.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        solidColorView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12).isActive = true
        solidColorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //myLabel constraints
        myLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12).isActive = true
        
    }
    //окрашивание ячейки
    override func setSelected(_ selected: Bool, animated: Bool) {
//        self.myLabel.backgroundColor = selected ? .blue : .white
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        self.myLabel.textColor = highlighted ? .blue : .white
//        self.backgroundColor = highlighted ? .cyan : .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
