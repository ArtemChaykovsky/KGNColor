//
//  UIColor+Hex.swift
//  UIColor+Hex
//
//  Created by David Keegan on 9/24/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

import UIKit

extension UIColor {

    public convenience init(hex: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16)/255.0,
            green: CGFloat((hex & 0xFF00) >> 8)/255.0,
            blue: CGFloat((hex & 0xFF))/255.0,
            alpha: alpha
        )
    }

    public var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let components = CGColorGetComponents(self.CGColor)
        if CGColorGetNumberOfComponents(self.CGColor) == 2 {
            return (components[0], components[0], components[0], components[1])
        }
        return (components[0], components[1], components[2], components[3])
    }

    public func invert() -> UIColor{
        let components = self.components
        return UIColor(red: 1-components.red, green: 1-components.green, blue: 1-components.blue, alpha: components.alpha)
    }

    public func lighten(lighten: CGFloat) -> UIColor{
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: hue, saturation: saturation*(1-lighten), brightness: brightness*(1+lighten), alpha: alpha)
    }

    public func darken(darken: CGFloat) -> UIColor{
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: hue, saturation: saturation*(1+darken), brightness: brightness*(1-darken), alpha: alpha)
    }

}
