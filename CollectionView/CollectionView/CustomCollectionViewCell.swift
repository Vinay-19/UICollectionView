//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-08.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionImgView: UIImageView!
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage){
        collectionImgView.image = image
    }

    static func nib() ->UINib {
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    }
    
}
