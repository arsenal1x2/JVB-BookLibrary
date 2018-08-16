//
//  MenuViewController.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var menuOptionTableView: UITableView!
    var itemMenu:[NSDictionary] = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        // Do any additional setup after loading the view.
    }
    func setupTableView() {
         itemMenu.append(["icon":"icons8-home","title":"Trang chủ"])
         itemMenu.append(["icon":"icons8-book-filled","title":"Quản lý sách"])
         itemMenu.append(["icon":"icons8-reading","title":"Quản lý người đọc"])
         itemMenu.append(["icon":"icons8-borrow-book-filled","title":"Quản lý mượn/trả sách"])
         itemMenu.append(["icon":"icons8-small-business-filled","title":"Quản lý kho sách"])
         itemMenu.append(["icon":"icons8-edit-graph-report","title":"Báo cáo thống kê"])
         itemMenu.append(["icon":"icons8-edit-account-filled","title":"Sửa thông tin tài khoản"])
         itemMenu.append(["icon":"icons8-help","title":"Trợ giúp"])
        menuOptionTableView.dataSource = self
        menuOptionTableView.delegate = self
        logoutBtn.layer.cornerRadius = 6.0
        logoutBtn.layer.borderWidth = 2
        logoutBtn.clipsToBounds = true
        logoutBtn.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLogoutButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
extension MenuViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuOptionTableView.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        cell.iconImg.image = UIImage(named: itemMenu[indexPath.row].value(forKey: "icon") as! String)
        cell.titleLbl.text = itemMenu[indexPath.row].value(forKey: "title") as? String
        return cell
    }
    
    
}
