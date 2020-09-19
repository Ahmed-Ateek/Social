//
//  PresenterPostsVC.swift
//  Social
//
//  Created by Tk on 15/09/2020.
//  Copyright © 2020 Ahmed Ateek. All rights reserved.
//

import Foundation
protocol PostsImagesCellView {
    func displayName(name:String)
    func displayImage(image:String)
    func postDescription(description:String)
    func displayLikesCount(count:Int)
    
}
protocol PostsImagesVideolView {
    func displayName(name:String)
    func displaythumb(videoThumb:URL)
    func postDescription(description:String)
    func displayLikesCount(count:Int)
    
}
protocol PostsTxtCellView {
    func displayName(name:String)
    func postDescription(description:String)
    func displayLikesCount(count:Int)
    
}
protocol PostsVCView:class {
    func showLoading()
    func hideLoading()
    func dataLoaded()
    func playVideo(Url:URL)
    func segueToAddPost()
    
}
class PresenterPostsVC {
    private  weak var delegate:PostsVCView?
    private var interactor = InteractorPostsVC()
    init(delegate:PostsVCView) {
        self.delegate = delegate
    }
    
    func sendCountToTableView() -> Int{
        interactor.posts.count
    }
    
    func checkPostType(index:Int) -> Int {
        return interactor.posts[index].postType
    }
    
    func configureImagesCell(cell:PostsCell,index:Int){
        cell.displayImage(image: interactor.posts[index].imageUrl)
        cell.displayName(name: interactor.posts[index].title)
        cell.displayLikesCount(count: interactor.posts[index].likesCount)
        cell.postDescription(description: interactor.posts[index].description)
        if interactor.posts[index].likesCount > 0 {
            cell.likeBtn.setImage(#imageLiteral(resourceName: "ic-likeActive"), for: .normal)
        }else if interactor.posts[index].likesCount <= 0{
            cell.likeBtn.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        }
    }
    
    func configureTxtCell(cell:PostsTextCell,index:Int){
        cell.displayName(name: interactor.posts[index].title)
        cell.displayLikesCount(count: interactor.posts[index].likesCount)
        cell.postDescription(description: interactor.posts[index].description)
        if interactor.posts[index].likesCount > 0 {
            cell.likeBtn.setImage(#imageLiteral(resourceName: "ic-likeActive"), for: .normal)
        }else if interactor.posts[index].likesCount <= 0{
            cell.likeBtn.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        }
    }
    
    func configureVideoCell(cell:PostsVideoCell,index:Int){
        
        
        cell.displaythumb(videoThumb: getPath(index:index))
        cell.displayName(name: interactor.posts[index].title)
        cell.displayLikesCount(count: interactor.posts[index].likesCount)
        cell.postDescription(description: interactor.posts[index].description)
        if interactor.posts[index].likesCount > 0 {
            cell.likeBtn.setImage(#imageLiteral(resourceName: "ic-likeActive"), for: .normal)
        }else if interactor.posts[index].likesCount <= 0{
            cell.likeBtn.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        }
    }
    
    
    func setLike(index:Int){
        if interactor.posts[index].likesCount > 0 {
            interactor.posts[index].likesCount = interactor.posts[index].likesCount - 1
        }else if interactor.posts[index].likesCount <= 0{
            interactor.posts[index].likesCount += 1
        }
        delegate?.dataLoaded()
    }
    func didSelectIndex(index:Int){
        switch checkPostType(index:index) {
        case 2:
            playVideo(index: index)
        default:
            return
        }
    }
    
    func  playVideo(index:Int)  {
        delegate?.playVideo(Url: getPath(index:index))
    }
    
    func getPath(index:Int) -> URL{
        
        let path:URL = Bundle.main.url(forResource: interactor.posts[index].videoUrl, withExtension: "mov")!
        return path
    }
    func goToAddPost(){
        delegate?.segueToAddPost()
    }
}
