//
//  ViewController.swift
//  Social
//
//  Created by Tk on 15/09/2020.
//  Copyright © 2020 Ahmed Ateek. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class PostsVC: UIViewController {
    // Out Let
    @IBOutlet weak var newsFeedTb:UITableView!
    var presenter:PresenterPostsVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PresenterPostsVC(delegate: self)
        setupView()
    }
    
    @IBAction func newPost(_ sender:UIButton){
        presenter.goToAddPost()
    }
}
// extension for Presenter
extension PostsVC: PostsVCView{
    func segueToAddPost() {
        
    }
    
    func playVideo(Url: URL) {
        let player = AVPlayer(url: Url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    func showLoading() {
        startIndicator(view: self.view)
    }
    
    func hideLoading() {
        stopIndicator(view: self.view)
    }
    
    func dataLoaded() {
        newsFeedTb.reloadData()
    }
    
    
}
// extension for TableView
extension PostsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.sendCountToTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.checkPostType(index: indexPath.row) {
        case 1:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as? PostsCell{
                presenter.configureImagesCell(cell: cell, index: indexPath.row)
                cell.likeAction = {
                    self.presenter.setLike(index: indexPath.row)
                }
                return cell
            }else{
                return UITableViewCell()
            }
            
        case 2:
            
            if let videoCell = tableView.dequeueReusableCell(withIdentifier: "PostsVideoCell", for: indexPath) as? PostsVideoCell{
                presenter.configureVideoCell(cell: videoCell, index: indexPath.row)
                videoCell.likeAction = {
                    self.presenter.setLike(index: indexPath.row)
                }
                return videoCell
            }else{
                return UITableViewCell()
            }
            
        case 3:
            if let txtcell = tableView.dequeueReusableCell(withIdentifier: "PostsTextCell", for: indexPath) as? PostsTextCell{
                presenter.configureTxtCell(cell: txtcell, index: indexPath.row)
                txtcell.likeAction = {
                    self.presenter.setLike(index: indexPath.row)
                }
                return txtcell
            }else{
                return UITableViewCell()
            }
            
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectIndex(index: indexPath.row)
    }
    
}
// extension for VC 
extension PostsVC{
    private func setupView(){
        newsFeedTb.dataSource = self
        newsFeedTb.delegate = self
        newsFeedTb.register(UINib(nibName: "PostsCell", bundle: nil), forCellReuseIdentifier: "PostsCell")
        newsFeedTb.register(UINib(nibName: "PostsVideoCell", bundle: nil), forCellReuseIdentifier: "PostsVideoCell")
        newsFeedTb.register(UINib(nibName: "PostsTextCell", bundle: nil), forCellReuseIdentifier: "PostsTextCell")
        
    }
}
