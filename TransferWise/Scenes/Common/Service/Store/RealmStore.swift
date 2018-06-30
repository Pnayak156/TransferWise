//
//  RealmStore.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

import RealmSwift

final class RealmStore {
  let storeQueue = DispatchQueue(label: "com.queue.store")
}

extension RealmStore: StoreType {
  //MARK:- Posts
  func storePosts(_ posts: [PostType]) {
    storeQueue.async {
      let _ = autoreleasepool {
        let realm = try! Realm()
        for post in posts {
          if let _ = realm.object(ofType: RealmPost.self, forPrimaryKey: post.id) {
            continue
          }
          realm.beginWrite()
          let realmPost = RealmPost(post: post)
          realm.add(realmPost)
          try! realm.commitWrite()
        }
      }
    }
  }
  
  func fetchPosts(completionHandler: @escaping ([PostType]) -> Void) {
    storeQueue.async {
      let _ = autoreleasepool {
        let realm = try! Realm()
        let realmPosts = realm.objects(RealmPost.self)
        let posts: [Post] = realmPosts.compactMap({ (realmPost: RealmPost) -> Post? in
          let post = Post(realmPost: realmPost)
          return post
        })
        completionHandler(posts)
      }
    }
  }

  //MARK:- Comments
  func storeComments(_ comments: [CommentType]) {
    storeQueue.async {
      let _ = autoreleasepool {
        let realm = try! Realm()
        for comment in comments {
          if let _ = realm.object(ofType: RealmComment.self, forPrimaryKey: comment.id) {
            continue
          }
          realm.beginWrite()
          let realmComment = RealmComment(comment: comment)
          realm.add(realmComment)
          try! realm.commitWrite()
        }
      }
    }
  }

  func fetchCommentsFor(postId: Int, completionHandler: @escaping ([CommentType]) -> Void) {
    storeQueue.async {
      let _ = autoreleasepool {
        let realm = try! Realm()
        let realmComments = realm.objects(RealmComment.self).filter("postId == \(postId)")
        let comments: [Comment] = realmComments.compactMap({ (realmComment: RealmComment) -> Comment? in
          let comment = Comment(realmComment: realmComment)
          return comment
        })
        completionHandler(comments)
      }
    }
  }
  
}
