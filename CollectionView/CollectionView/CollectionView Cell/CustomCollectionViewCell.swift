//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-08.
//

import UIKit
import SDWebImage
class CustomCollectionViewCell: UICollectionViewCell {

   
    
    
    @IBOutlet weak var collectionImgView: UIImageView!
    
    @IBOutlet weak var empName: UILabel!
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionImgView.layer.cornerRadius = 40
    }
    
    public func configure(with url: String, empFullName: String){
        collectionImgView.sd_setImage(with: URL(string: url))
        empName.text = empFullName
    }

    static func nib() ->UINib {
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    }
    
}
