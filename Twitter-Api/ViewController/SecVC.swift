//
//  SecVC.swift
//  Twitter-Api
//
//  Created by Rahul Sharma on 23/10/24.
//

import UIKit

class SecVC: UIViewController {
    
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var locationtxf: UITextField!
    
    @IBOutlet weak var follwrestxf: UITextField!
    
    var datapass : FollowersModel?
    
    var twitterVM = TwitterViewModel()
    
    @IBOutlet weak var cvcell: UICollectionView!
    
    
    var callback:((FollowersModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cvcell.register(TwitterCVCell.self, forCellWithReuseIdentifier: "TwitterCVCell")

        self.twitterVM.getData { result in
            if result
            {
                self.cvcell.reloadData()
            }
            else
            {
                print("Error")
            }
        }
        
        cvcell.dataSource = self
         cvcell.delegate = self
        
        nametextfield.text = datapass?.name ?? ""
        locationtxf.text = datapass?.location ?? ""
        follwrestxf.text = "\(datapass?.followers_count ?? 0)"
        
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func editbtn(_ sender: UIButton) 
    {
        datapass?.name = nametextfield.text ?? ""
        datapass?.location = locationtxf.text ?? ""
        datapass?.followers_count = Int(follwrestxf.text ?? "") ?? 0
        callback?(datapass!)
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension SecVC : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return twitterVM.twitterData?.followers?.count ?? 00
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwitterCVCell", for: indexPath) as! TwitterCVCell
        if let data = twitterVM.twitterData?.followers?[indexPath.row]
        {
            cell.setData(data: data)
        }
        return cell
    }
    
    
}
