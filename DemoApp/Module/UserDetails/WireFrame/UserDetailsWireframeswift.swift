//
//  UserDetailsWireframeswift.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

class UserDetailsWireframe: UserDetailsWireframeProtocol {
  
    static func presentUserDetailsView(fromView: AnyObject,item:NSDictionary) {
        let view: UserDetailViewProtocol = UserDetailsViewController()
        let presenter: UserDetailsPresenterProtocol  = UserDetailsPresenter()
        let interactor: UserDetailsInteractorProtocol = UserDetailsInteractor()
        let APIDataManager: UserDetailsAPIDataManagerProtocol = UserDetailsAPIDataManager()
        let wireFrame: UserDetailsWireframeProtocol = UserDetailsWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager

        let viewController = view as! UserDetailsViewController
        viewController.item = item
        NavigationHelper.pushViewController(viewController: viewController)
    }
    
  

}
