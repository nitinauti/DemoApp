//
//  UserListListPresenter.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

class UserListPresenter:UserListPresenterProtocol{
    
    // MARK: Variables
    var view: UserListViewProtocol?
    var interactor: UserListInteractorProtocol?
    var wireFrame: UserListWireframeProtocol?
    
  
    /// called form presneter to intractor get user list
    func getUserList() {
        interactor?.getUserList()
    }
    
   func fetchedUserList() {
      self.view?.showUserList()
    }
    
    func presentUserDetailScreen(item:NSDictionary){
        wireFrame?.presentUserDetailScreen(item:item)
    }
   
   
}
