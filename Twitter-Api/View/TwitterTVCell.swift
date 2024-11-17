//
//  TwitterTVCell.swift
//  Twitter-Api
//
//  Created by Rahul Sharma on 23/10/24.
//

import UIKit

class TwitterTVCell: UITableViewCell {
    
    @IBOutlet weak var profileimg: UIImageView!
    
    @IBOutlet weak var namelbl: UILabel!
    
    @IBOutlet weak var followerslbl: UILabel!
    
    @IBOutlet weak var friendslbl: UILabel!
    
    @IBOutlet weak var locationlbl: UILabel!
    
    @IBOutlet weak var deletebtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data : FollowersModel) {
    namelbl.text = data.name ?? ""
    followerslbl.text = "\(data.followers_count ?? 0)"
    friendslbl.text = "\(data.friends_count ?? 0)"
    locationlbl.text = data.location ?? ""
    Helper.getImgFromUrl(imgView: self.profileimg, url: data.profile_image ?? "")
    
}
    
}
