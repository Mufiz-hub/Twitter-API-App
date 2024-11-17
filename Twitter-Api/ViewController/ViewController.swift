//
//  ViewController.swift
//  Twitter-Api
//
//  Created by Rahul Sharma on 23/10/24.
//

import UIKit

class ViewController: UIViewController {
    

    var twitterVM = TwitterViewModel()
    @IBOutlet weak var tblview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblview.register(UINib(nibName: "TwitterTVCell", bundle: nil), forCellReuseIdentifier: "TwitterTVCell")
        if self.twitterVM.getData() == nil
        {
            self.twitterVM.getData { result in
                if result
                {
                   
                    self.tblview.reloadData()
                }
                else
                {
                    print("Error")
                }
            }
        }
     
        else
        {
            self.twitterVM.twitterData = twitterVM.getData()
            self.tblview.reloadData()
        }
     
        // Do any additional setup after loading the view.
    }
    
    @objc func DeleteACT(btn : UIButton)
    {
        let refreshAlert = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.twitterVM.twitterData?.followers?.remove(at: btn.tag)
            self.twitterVM.saveData(data: self.twitterVM.twitterData!)
            self.tblview.reloadData()
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        present(refreshAlert, animated: true, completion: nil)
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twitterVM.twitterData?.followers?.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterTVCell", for: indexPath) as! TwitterTVCell
        if let data = twitterVM.twitterData?.followers?[indexPath.row]
        {
            cell.setData(data: data)
        }
        cell.deletebtn.tag = indexPath.row
        cell.deletebtn.addTarget(self, action: #selector(DeleteACT(btn: )), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecVC") as! SecVC
        vc.datapass = twitterVM.twitterData?.followers?[indexPath.row]
        vc.callback = {value in
            self.twitterVM.twitterData?.followers?[indexPath.row] = value
            self.twitterVM.saveData(data: self.twitterVM.twitterData!)
            self.tblview.reloadData()
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}
