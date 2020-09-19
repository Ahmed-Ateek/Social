//
//  PostsModel.swift
//  Social
//
//  Created by Tk on 15/09/2020.
//  Copyright © 2020 Ahmed Ateek. All rights reserved.
//

import Foundation
struct PostsModel {
    let id:Int
    let title:String
    let description:String
    let imageUrl:String
    let videoUrl:String
    var likesCount:Int
    // post type to know the post is it Vid or Img or Txt
    let postType:Int
    var isLiked:Bool
}
