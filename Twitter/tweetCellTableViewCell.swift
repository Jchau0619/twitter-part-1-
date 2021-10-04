//
//  tweetCellTableViewCell.swift
//  Twitter
//
//  Created by Justin Chau  on 9/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class tweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {self.setFavorite(true)}, failure: {(error) in print ("favorite did not succeed: \(error) ")})
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {self.setFavorite(false)}, failure: {(error)in print ("unfavorite did not work \(error)")})
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetID: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print ("error in retweeding \(error)")
            
        })
    
        
        
        
    }
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    
    
    var favorited:Bool = false
    var tweetId = -1
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
