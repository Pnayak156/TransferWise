//
//  AppCoordinator.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  private let window: UIWindow?
  
  private lazy var apiClient: APIClientType = {
    return APIClient()
  }()
  
  private lazy var store: StoreType = {
    return RealmStore()
  }()
  
  init(window: UIWindow?) {
    self.window = window
  }
  
  override func start() {
    
    guard let window = window else {
      return
    }
    let navigationController = UINavigationController()
    let postCoordinator = PostListCoordinator(navigationController: navigationController, apiClient: apiClient, store: store)
    addChildCoordinator(postCoordinator)
    window.rootViewController = navigationController
    postCoordinator.start()
    window.makeKeyAndVisible()
  }
  override func finish() {
    //Emoty implementaion
  }
}
