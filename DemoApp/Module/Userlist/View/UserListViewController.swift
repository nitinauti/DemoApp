//
//  UserListViewController.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class UserListViewController:BaseViewContoller, UserListViewProtocol,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
   
      
    // MARK: - Variable
    var presenter: UserListPresenterProtocol?
    @IBOutlet  var parentView: UIView!
    var postion : Int = 400
    var itemarray = NSArray()
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var resultarray = NSMutableArray()
    
/// Overwritten method from UIVIewController, it calls a method to setShadowView
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        safeArea = view.layoutMarginsGuide
        self.startAnimation()
        presenter?.getUserList()
        self.setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    func setupTableView() {
          view.addSubview(tableView)
          tableView.translatesAutoresizingMaskIntoConstraints = false
          tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    
   func showUserList() {
        self.stopAnimatig()
        self.itemarray = (userList.sharedInstance.getUserData()?.list ?? [])
        self.loadList()
        tableView.reloadData()
    }
   

}

extension UserListViewController {

    // MARK: UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultarray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = resultarray[indexPath.row] as? NSDictionary ?? [:]

        if (item.value(forKey:"level") as? String ?? "") == "zero" {
            
           var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            
           if( !(cell != nil))
           {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
           }
            
            cell?.textLabel?.text = item.value(forKey:"type") as? String ?? ""
            
            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListTableViewCell

            cell.id.text = item["id"] as? String ?? ""
            cell.type.text = item["type"] as? String ?? ""
            cell.date.text = item["date"] as? String ?? ""
            cell.data.text = item["data"] as? String ?? ""
           
            return cell
        }
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
       
        let item = resultarray[indexPath.row] as? NSDictionary ?? [:]
       
        if (item.value(forKey:"level") as? String ?? "") == "zero" {
            return 60
        }else{
            return UITableView.automaticDimension

        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let item = self.resultarray[indexPath.row] as? NSDictionary ?? [:]
         if (item.value(forKey:"level") as? String ?? "") == "zero" {
            return
         }else{
            presenter?.presentUserDetailScreen(item:item)
         }
    }
    
    func loadList(){
        self.itemarray = (userList.sharedInstance.getUserData()?.list ?? [])
        self.resultarray = NSMutableArray.init()
        let sortDescriptor = NSSortDescriptor.init(key: "type", ascending:false)
        let sortedArray = self.itemarray.sortedArray(using:[sortDescriptor]) as NSArray
        let groups = sortedArray.value(forKeyPath:"@distinctUnionOfObjects.type") as? NSArray ?? []
       
         for type in groups {
          let list:[String:String] = [
                "type":type as? String ?? "",
                "level":"zero"
            ]
            let bPredicate: NSPredicate = NSPredicate(format: "type = %@",type as? String ?? "")
            let filteredArray = sortedArray.filtered(using:bPredicate)
            
            self.resultarray.add(list)
            self.getchildObject(list:filteredArray as NSArray)
        }
    }
    
    func getchildObject(list:NSArray){
        for dict in list {
            self.resultarray.add(dict)
        }

    }
    
    
}

