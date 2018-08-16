//
//  HomeViewController.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
protocol HomeViewControllerDelegate {
    func didPressedButtonLogout()
}
class HomeViewController: UIViewController {

    
    @IBOutlet weak var newUpdateBtn: UIButton!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var hightlightBtn: UIButton!
    @IBOutlet weak var booksCollectionView: UICollectionView!
    @IBOutlet weak var topView: UIView!
    var delegate:HomeViewControllerDelegate?
    override func viewDidLoad() {
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        setupView()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func clickButtonSearch(_ sender: Any) {
    }
    func setupView() {
        setBoderButton(button: allBtn)
        setBoderButton(button: hightlightBtn)
        setBoderButton(button: newUpdateBtn)
    }
    func setBoderButton(button:UIButton) {
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
    }

}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = booksCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
        return cell
    }
    
    
}
