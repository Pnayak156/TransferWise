//
//  PostViewModel.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

struct PostViewModel {
  let post: PostType
}

extension PostViewModel: PostViewModelType {
  
  var title: String {
    return post.title
  }
  
  var body: String {
    return post.body
  }
  
}
