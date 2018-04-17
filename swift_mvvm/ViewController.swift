//
//  ViewController.swift
//  swift_mvvm
//
//  Created by 蜂尚网络 on 2018/4/17.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    
    enum layoutSizeModel {//设置两种状态
        case oneModel
        case twoModel
    }
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var collectionView:UICollectionView?
     let flowLayout = UICollectionViewFlowLayout()
    
    var model:layoutSizeModel = .oneModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let rightBarButtonItem = UIBarButtonItem(title: "切换布局", style: .plain, target: self, action: #selector(self.rightClick))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
       
        collectionView = UICollectionView(frame:(CGRect(x: 0, y: 0, width: width, height: height)), collectionViewLayout: flowLayout)
        flowLayout.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
        collectionView?.register(UINib.init(nibName: "layoutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellId")
        collectionView?.backgroundColor = UIColor.white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        
        
        
    }
    
    @objc private func rightClick() {
        print("rightClick")
        if model == .oneModel {
            model = .twoModel
        }else{
            model = .oneModel
        }
        self.refreshCollectionView(model: model)
    }
    
    
    func refreshCollectionView(model:layoutSizeModel) -> Void {
        if model == .oneModel {
            flowLayout.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
            collectionView?.register(UINib.init(nibName: "layoutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellId")
        }else{
            flowLayout.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
            collectionView?.register(UINib.init(nibName: "twoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellIdTwo")
        }
        collectionView?.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = layoutCollectionViewCell()
        var cellTwo = twoCollectionViewCell()
        
        if model == .oneModel {
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! layoutCollectionViewCell
            cell.label.text = String(indexPath.item)
            return cell
        }else{
            cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdTwo", for: indexPath) as! twoCollectionViewCell
            cellTwo.twoLabel.text = String(indexPath.item)+"杯酒"
            return cellTwo
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
 


}

