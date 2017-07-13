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
        
//        let view = TestView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
//        self.view .addSubview(view)
        
   
        self.view.backgroundColor = .red
        
        let button = QMUILinkButton.init(frame: CGRect.init(x: 200, y: 200, width: 50, height: 200))
        button.underlineColor = UIColor.red
        button.setTitle("first", for: UIControlState.normal)
        view.addSubview(button)
        
        let btn = QMUIButton.init(frame: CGRect.init(x: 80, y: 80, width: 80, height: 80))
        btn.setTitle("hello", for: UIControlState.normal)
        btn.sizeToFit()
        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 10
        view.addSubview(btn)
        
        let v = UIView.init(frame: CGRect.init(x: 70, y: 70, width: 80, height: 80))
        v.backgroundColor = .yellow
        view.addSubview(v)

        let image = UIImageView.init(frame: CGRect.init(x: 60, y: 60, width: 60, height: 60))
        image.image = TheImage.useFitImage(width: 60, height: 60)
        view.addSubview(image)
        
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

