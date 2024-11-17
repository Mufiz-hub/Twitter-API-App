//
//  TwitterCVCell.swift
//  Twitter-Api
//
//  Created by Rahul Sharma on 24/10/24.
//

import UIKit

class TwitterCVCell: UICollectionViewCell {
    
    @IBOutlet weak var profileimage: UIImageView!
    
    @IBOutlet weak var accountnamelbl: UILabel!
    
    @IBOutlet weak var accountfollwerslbl: UILabel!
    
    @IBOutlet weak var accountfriendslbl: UILabel!
    
    @IBOutlet weak var accoountlocationlbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data : FollowersModel)
    {
        
            accountnamelbl.text = data.name ?? ""
            accountfollwerslbl.text = "\(data.followers_count ?? 0)"
            accountfriendslbl.text = "\(data.friends_count ?? 0)"
            accoountlocationlbl.text = data.location ?? ""
            
            Helper.getImgFromUrl(imgView: self.profileimage, url: data.profile_image ?? "")
        
        
    }
    
}
