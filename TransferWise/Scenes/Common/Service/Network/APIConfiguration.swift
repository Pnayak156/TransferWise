//
//  APIConfiguration.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
  func asURLRequest() -> URLRequest?
}

enum HTTPMethod: String {
  case GET
  case POST
}

protocol APIConfiguration: URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var queryParam: [URLQueryItem]? { get }
}
