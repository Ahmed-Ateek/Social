//
//  PostsVideoCell.swift
//  Social
//
//  Created by Tk on 16/09/2020.
//  Copyright © 2020 Ahmed Ateek. All rights reserved.
//

import UIKit
import AVKit
class PostsVideoCell: UITableViewCell {
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
extension PostsVideoCell:PostsImagesVideolView{
    func displaythumb(videoThumb: URL) {
        AVAsset(url: videoThumb).generateThumbnail { [weak self] (image) in
            DispatchQueue.main.async {
                guard let image = image else { return }
                self?.postContent.image = image
            }
        }
    }
    
    
    
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
