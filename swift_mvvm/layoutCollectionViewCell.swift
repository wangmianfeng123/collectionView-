//
//  layoutCollectionViewCell.swift
//  swift_mvvm
//
//  Created by 蜂尚网络 on 2018/4/17.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit

class layoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var singleItem: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.singleItem.backgroundColor = UIColor.yellow
    }

}
