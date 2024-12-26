//
//  UIColor+Extention.swift
//  FoodDelApp
//
//  Created by user on 22.12.2024.
//

import UIKit

extension UIColor {
    func hex(_ rgbValue: UInt64) -> UIColor {
        return UIColor {_ in 
            UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
}
