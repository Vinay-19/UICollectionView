//
//  Extension+UIColor.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-12.
//

import UIKit


extension UIColor {
    
    static func getRandomColor() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    
}
