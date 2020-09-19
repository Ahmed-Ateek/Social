//
//  PostsTextCell.swift
//  Social
//
//  Created by Tk on 19/09/2020.
//  Copyright © 2020 Ahmed Ateek. All rights reserved.
//

import UIKit

class PostsTextCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    
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
extension PostsTextCell:PostsTxtCellView{
  
    
    func displayName(name: String) {
        userName.text = name
    }
    
  
    func postDescription(description: String) {
        descriptionTxt.text = description
    }
    
    
    func displayLikesCount(count: Int) {
        likeCount.text = "\(count)"
    }
    
    
}
