//
//  TwitterModel.swift
//  Twitter-Api
//
//  Created by Rahul Sharma on 23/10/24.
//

import Foundation

struct MainTwitterModel : Codable{
    var followers : [FollowersModel]?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.followers = try container.decodeIfPresent([FollowersModel].self, forKey: .followers)
    }
}

struct FollowersModel : Codable
{
    var profile_image : String?
    var followers_count : Int?
    var friends_count : Int?
    var location : String?
    var name : String?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.profile_image = try container.decodeIfPresent(String.self, forKey: .profile_image)
        self.followers_count = try container.decodeIfPresent(Int.self, forKey: .followers_count)
        self.friends_count = try container.decodeIfPresent(Int.self, forKey: .friends_count)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
}
