//
//  ViewController.swift
//  Test
//
//  Created by Dzy on 22/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import UIKit

import Alamofire
import RAMAnimatedTabBarController

import QMUIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var ItemView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = QMUIButton.init(frame: CGRect.init(x: 80, y: 80, width: 80, height: 80))
        btn.setTitle("hello", for: UIControlState.normal)
        btn.sizeToFit()
        view.addSubview(btn)
        log.debug("hello")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

