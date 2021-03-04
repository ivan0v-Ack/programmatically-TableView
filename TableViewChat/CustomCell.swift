//
//  CustomCell.swift
//  TableViewChat
//
//  Created by Ivan Ivanov on 3/4/21.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    
    var newMesseage: Message? {
        didSet{
            guard let message = newMesseage else {return}
            textTitle.text = message.text
            textTitle.font = UIFont.systemFont(ofSize: 14)
            textTitle.tintColor = .black
            textTitle.numberOfLines = 0
            
            wrapperView.backgroundColor = message.selfSender ? .white : #colorLiteral(red: 0.2292903662, green: 0.7179198861, blue: 0.2874755561, alpha: 1)
            textTitle.textColor = message.selfSender ? .black : .white
            
            if message.selfSender {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        [wrapperView, textTitle].forEach({addSubview($0)})
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var textTitle:UILabel = {
        let label = UILabel()
        label.text = "Some Text"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.tintColor = .black
        return label
        
        
    }()
    
    lazy var wrapperView: UIView = {
        let view = UIView()
         view.backgroundColor = .white
        view.layer.cornerRadius = frame.size.height / 2
        return view
    }()
  
        func constraints(){
            textTitle.translatesAutoresizingMaskIntoConstraints = false
            wrapperView.translatesAutoresizingMaskIntoConstraints = false
    
            leadingConstraint = textTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
            trailingConstraint = textTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    
            leadingConstraint.isActive = true
            trailingConstraint.isActive = false
    
            NSLayoutConstraint.activate([
                textTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                textTitle.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                textTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
    
    
            ])
    
            wrapperView.anchor(top: textTitle.topAnchor, leading: textTitle.leadingAnchor, bottom: textTitle.bottomAnchor, trailing: textTitle.trailingAnchor, padding: .init(top: -16, left: -16, bottom: 16, right: 16))
    
    
    }
}



