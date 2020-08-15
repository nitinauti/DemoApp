//
//  UserDetailsProtocols.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

protocol UserDetailViewProtocol:class {
    var presenter: UserDetailsPresenterProtocol? { get set }
    
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */

}

protocol UserDetailsWireframeProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    static func presentUserDetailsView(fromView:AnyObject,item:NSDictionary)

}

protocol UserDetailsProtocols: class {
        
}
protocol UserDetailsPresenterProtocol: class {
    var view: UserDetailViewProtocol? { get set }
    var interactor: UserDetailsInteractorProtocol? { get set }
    var wireFrame: UserDetailsWireframeProtocol? { get set }

    /**
    * Add here your methods for communication VIEW -> PRESENTER  &&   INTERACTOR -> PRESENTER   &&     PRESENTER -> INTERACTOR
    */

}
protocol UserDetailsInteractorProtocol: class {
    var presenter: UserDetailsPresenterProtocol? { get set }
    var APIDataManager: UserDetailsAPIDataManagerProtocol? { get set }
    
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}
protocol UserDetailsAPIDataManagerProtocol: class {
   
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */

    
}
protocol UserDetailsLocalDataManagerProtocol: class {
    
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
