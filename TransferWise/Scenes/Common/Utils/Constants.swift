//
//  Constants.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

enum Constants {
}

//MARK:- Network constants
extension Constants {
  enum APIParameterKey {
    static let postId = "postId"
  }
  
  enum HTTPHeaderKey: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
  }
  
  enum ContentType: String {
    case json = "application/json"
  }
}

//MARK:- Base url
extension Constants {
  enum Server {
    static let basePath = "https://jsonplaceholder.typicode.com"
  }
}
