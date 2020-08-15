//
//  UserListTableViewCell.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
             super.init(style: style, reuseIdentifier: reuseIdentifier)
             self.setupView()
         }

   func setupView() {
        addSubview(cellView)
        cellView.addSubview(idLBI)
        cellView.addSubview(id)
        cellView.addSubview(typeLBI)
        cellView.addSubview(type)
        cellView.addSubview(dateLBI)
        cellView.addSubview(date)
        cellView.addSubview(dataLBI)
        cellView.addSubview(data)
        self.selectionStyle = .none
        self.setView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setView(){
            
        cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellView.heightAnchor.constraint(equalToConstant: 140).isActive = true

        idLBI.heightAnchor.constraint(equalToConstant: 20).isActive = true
        idLBI.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 15).isActive = true
        idLBI.centerYAnchor.constraint(equalTo: id.centerYAnchor).isActive = true

        id.topAnchor.constraint(equalTo: cellView.topAnchor,constant:10).isActive = true
        id.leadingAnchor.constraint(equalTo: idLBI.trailingAnchor,constant:20).isActive = true
        id.trailingAnchor.constraint(equalTo: cellView.trailingAnchor,constant: 0).isActive = true

        typeLBI.heightAnchor.constraint(equalToConstant: 20).isActive = true
        typeLBI.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 15).isActive = true
        typeLBI.centerYAnchor.constraint(equalTo: type.centerYAnchor).isActive = true

        type.heightAnchor.constraint(equalToConstant:20).isActive = true
        type.topAnchor.constraint(equalTo: id.bottomAnchor,constant:10).isActive = true
        type.leadingAnchor.constraint(equalTo:typeLBI.trailingAnchor, constant:20).isActive = true

        dateLBI.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLBI.centerYAnchor.constraint(equalTo: date.centerYAnchor).isActive = true
        dateLBI.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 15).isActive = true

        date.heightAnchor.constraint(equalToConstant: 20).isActive = true
        date.topAnchor.constraint(equalTo: type.bottomAnchor,constant:10).isActive = true
        date.leadingAnchor.constraint(equalTo: dateLBI.trailingAnchor, constant: 20).isActive = true

        dataLBI.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dataLBI.centerYAnchor.constraint(equalTo: data.centerYAnchor).isActive = true
        dataLBI.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 15).isActive = true

        data.heightAnchor.constraint(equalToConstant: 20).isActive = true
        data.topAnchor.constraint(equalTo: date.bottomAnchor,constant:10).isActive = true
        data.leadingAnchor.constraint(equalTo: dateLBI.trailingAnchor, constant: 15).isActive = true
        data.widthAnchor.constraint(equalToConstant:250).isActive = true
            
        }
        
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addshadow(top: false, left: true, bottom: true, right: true, shadowRadius:10,shadowOpacity:0.2)
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
      }()
    
     let idLBI: UILabel = {
        let label = UILabel()
        label.text = "Id:"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
     }()
    
    let id: UILabel = {
       let label = UILabel()
       label.textColor = UIColor.black
       label.numberOfLines = .zero
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let typeLBI: UILabel = {
        let label = UILabel()
        label.text = "type:"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let type: UILabel = {
           let label = UILabel()
           label.text = "typevalue"
           label.textColor = UIColor.black
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
  
    let dateLBI: UILabel = {
          let label = UILabel()
          label.text = "Date:"
          label.textColor = UIColor.black
          label.font = UIFont.boldSystemFont(ofSize: 16)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
       }()
    
    let date: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
     }()
    
    let dataLBI: UILabel = {
        let label = UILabel()
        label.text = "Data:"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let data: UILabel = {
           let label = UILabel()
           label.text = "Data"
           label.textColor = UIColor.black
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
        
}
