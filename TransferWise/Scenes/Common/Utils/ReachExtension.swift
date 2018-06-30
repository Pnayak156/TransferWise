//
//  ReachExtension.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

extension Reach {
  public func isConnected() -> Bool {
    let status = self.connectionStatus()
    var isConnected = false
    switch status {
    case .online(_):
      isConnected = true
    default:
      isConnected = false
    }
    return isConnected
  }
}
