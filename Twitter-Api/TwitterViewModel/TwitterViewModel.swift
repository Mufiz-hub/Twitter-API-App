//
//  TwitterViewModel.swift
//  Twitter-Api
//
//  Created by Rahul Sharma on 23/10/24.
//

import Foundation


class TwitterViewModel : NSObject
{
    var twitterData : MainTwitterModel?
    
    func getData(completion : @escaping (Bool) -> Void)
    {
        let url = ApiKeys.base_Url + ApiKeys.Endpoint.endP
        
        let headers = [
            "x-rapidapi-key": "a245817a7cmsha858341b93e15a4p144d33jsn7431580f25bc",
            "x-rapidapi-host": "twitter-api45.p.rapidapi.com"
        ]
        
        NetworkCall(headers: headers, url: url, method: .get, isJSONRequest: false).executeQuery()
        {
            (result : Result <MainTwitterModel,Error>)in
            switch result {
            case .success(let post):
                print(post)
                self.twitterData = post
                self.saveData(data: post)
                completion(true)
                
            case .failure(let err):
                completion(false)
                print(err.localizedDescription)
                print(" ")
            }
        }
    }
    
    func saveData(data:MainTwitterModel){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data){
                UserDefaults.standard.set(encoded, forKey: "user_objects")
             }
    }
    func getData() -> MainTwitterModel?{
        if let objects = UserDefaults.standard.value(forKey: "user_objects") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(MainTwitterModel.self, from: objects) as MainTwitterModel {
                return objectsDecoded
                
            }
        }
        return nil
    }
}
