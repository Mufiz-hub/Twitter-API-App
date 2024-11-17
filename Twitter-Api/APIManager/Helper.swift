
import Foundation
import Kingfisher
import UIKit
struct ApiKeys
{
    static var base_Url = "https://twitter-api45.p.rapidapi.com/"
    static var api_Keys = ""
    struct Endpoint
    {
        static var endP = "list_followers.php?list_id=1177128103228989440"
    }
}

class Helper
{
    @MainActor class func getImgFromUrl(imgView : UIImageView,url : String)
    {
        let url = URL(string : url)
        imgView.kf.setImage(with: url,placeholder: UIImage(named: "placeHolder"))
    }
}
