//
//  PostsCell.swift
//  Social
//
//  Created by Tk on 15/09/2020.
//  Copyright © 2020 Ahmed Ateek. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postContent: UIImageView!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    var likeAction: (()->()) = {}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    @IBAction func addLikeBtn(_ sender: Any) {
        likeAction()
    }
    
}
extension PostsCell:PostsImagesCellView{
   
    
    func displayName(name: String) {
        userName.text = name
    }
    
    func displayImage(image: String) {
        
        postContent.image = UIImage(named: image)
    }
    func postDescription(description: String) {
        descriptionTxt.text = description
       }
    
    
    func displayLikesCount(count: Int) {
        likeCount.text = "\(count)"
    }
    
    
}
