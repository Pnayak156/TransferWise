//
//  APIEndPoint.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

enum APIEndPoint: APIConfiguration {
  
  case posts
  case comments(postId: Int)
  
  var path: String {
    switch self {
    case .posts:
      return "/posts"
    case .comments:
      return "/comments"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .posts, .comments:
      return .GET
    }
  }
  
  var queryParam: [URLQueryItem]? {
    switch self {
    case .comments(let postId):
      return [URLQueryItem.init(name: Constants.APIParameterKey.postId, value: String(postId))]
    case .posts:
      return nil
    }
  }
  
  
  
  func asURLRequest() -> URLRequest? {
    guard var urlComponent = URLComponents(string: Constants.Server.basePath) else {
      return nil
    }
    if let queryParams = queryParam {
      urlComponent.queryItems = queryParams
    }
    urlComponent.path = path
    guard let url = urlComponent.url else {
      return nil
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HTTPHeaderKey.acceptType.rawValue)
    urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HTTPHeaderKey.contentType.rawValue)
    urlRequest.httpMethod = method.rawValue
    return urlRequest
  }
}
