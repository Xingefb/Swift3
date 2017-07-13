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
        
   
        /*
         1
         数据统计 平台
         数据分析 教师平台
         提出方案 教师 （家长）
         执行方案 学生 （家长 教师）
         方案成果 平台展示 -> 学生 家长 教师
         
         成果分析
         方案更改
         执行方案
         方案成果
         
         。。。 
         
         2
         统一优质教学  哪个教师教的好 录成视频 远程教学 班内老师学习辅导
         考试统一规定  方便阶段审核 数据分析 每周小考 每月中考 半年 大考
         
         家庭作业分析  放学后会出现本分作业抄袭现象 每天最后一节课统一做作业
         
         试卷统一分析  
         
         3
         学校信息展示
         录取分数
         历年成绩
         报考指导
         平时缴费
         参观路线
         
         4
         学生信息展示
         综合能力分析
         学习成绩分析
         爱好分析
         考试成绩预测
         考取学校预测
         提分方案
         
         5
         爱好培养
         朋友圈
         生活写真
         个人作品
         旅游史
         
         */
        
        /*
         细分应用内容
         数据统计 平台
         
         1 各科分数
         2 各科总分比重
         3 各科内容错题比重
         4 成绩班级对比
         5 成绩同学对比
         6 成绩学校对比
         
         
         数据分析 教师平台
         
         1 每科授课教师根据分数分析知识点的错误点 和解决方案
         2 根据班级整体错误点分析 出 解决方案
         3 和其余班解决方案对比 取长补短
         4 班主任全班整体水平分析
         5 试卷知识点分析
         6 优秀学生答题方案分享
         7 解决教师繁琐的统计
         
         方案成果
        
         1 重考试题乱序乱内容 重考成绩
         2 错点重错率
         3 成绩数据分析
         4 方案效果占预计的百分比
         
         
         */
//        self.view.backgroundColor = .red
        
        let button = QMUILinkButton.init(frame: CGRect.init(x: 200, y: 200, width: 50, height: 200))
        button.underlineColor = UIColor.red
        button.setTitle("first", for: UIControlState.normal)
//        view.addSubview(button)
        
        let btn = QMUIButton.init(frame: CGRect.init(x: 80, y: 80, width: 80, height: 80))
        btn.setTitle("hello", for: UIControlState.normal)
        btn.sizeToFit()
        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 10
//        view.addSubview(btn)
        
        let v = UIView.init(frame: CGRect.init(x: 70, y: 70, width: 80, height: 80))
        v.backgroundColor = .yellow
//        view.addSubview(v)

        let wh:CGFloat = 60
        
        let image = UIImageView.init(frame: CGRect.init(x: 60, y: 60, width: wh, height: wh))
        image.image = TheImage.useFitImage(width: wh, height: wh)
        view.addSubview(image)
        
        let image1 = UIImageView.init(frame: CGRect.init(x: 140, y: 60, width: wh, height: wh))
        image1.image = UIImage.init(named: "screenShot20170713At102217AM.png")
        image1.contentMode = .scaleAspectFit
        view.addSubview(image1)

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

