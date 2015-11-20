//
//  UIImageColorPicker.swift
//
//  Created by Darktt on 15/11/20.
//  Copyright © 2015年 Darktt. All rights reserved.
//

import UIKit

extension UIImage
{
    public func pickColor(fromPoint point: CGPoint) -> UIColor
    {
        guard let _ = self.CGImage else {
            return UIColor.blackColor()
        }
        
        var color: UIColor = UIColor.blackColor()
        
        let cgImage: CGImageRef = self.CGImage!
        let width: Int = CGImageGetWidth(cgImage)
        let height: Int = CGImageGetHeight(cgImage)
        
        let x: Int = Int(floor(point.x) * self.scale)
        let y: Int = Int(floor(point.y) * self.scale)
        
        if (x < width) && (y < height) {
            let provider: CGDataProviderRef = CGImageGetDataProvider(cgImage)!
            
            if let bitmapData: CFDataRef = CGDataProviderCopyData(provider) {
                let data: UnsafePointer<UInt8> = CFDataGetBytePtr(bitmapData)
                
                let offset: Int = ((width * y) + x) * 4
                
                let red     = CGFloat(data[offset]) / CGFloat(255.0)
                let green   = CGFloat(data[offset + 1]) / CGFloat(255.0)
                let blue    = CGFloat(data[offset + 2]) / CGFloat(255.0)
                let alpha   = CGFloat(data[offset + 3]) / CGFloat(255.0)
                
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
        }
        
        return color
    }
    
    public func convertPoint(point: CGPoint, fromImageView imageView: UIImageView) -> CGPoint
    {
        var imagePoint: CGPoint = point
        
        let imageSize: CGSize = self.size
        let viewSize: CGSize = imageView.bounds.size
        
        let ratioX: CGFloat = viewSize.width / imageSize.width
        let ratioY: CGFloat = viewSize.height / imageSize.height
        
        let contentMode: UIViewContentMode = imageView.contentMode
        
        switch contentMode {
        case .ScaleToFill, .Redraw:
            imagePoint.x /= ratioX
            imagePoint.y /= ratioY
            break
            
        case .ScaleAspectFill, .ScaleAspectFit:
            var scale: CGFloat = 0
            
            if case .ScaleAspectFit = contentMode {
                scale = min(ratioX, ratioY)
            } else if case .ScaleAspectFill = contentMode {
                scale = max(ratioX, ratioY)
            }
            
            // Remove the x or y margin added in FitMode
            imagePoint.x -= (viewSize.width - imageSize.width * scale) / 2.0
            imagePoint.y -= (viewSize.height - imageSize.height * scale) / 2.0
            imagePoint.x /= scale
            imagePoint.y /= scale
            
            break
            
        case .Center:
            imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
            imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
            break
            
        case .Top:
            imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
            break
            
        case .Bottom:
            imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
            imagePoint.y -= (viewSize.height - imageSize.height)
            break
            
        case .Left:
            imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
            break
            
        case .Right:
            imagePoint.x -= (viewSize.width - imageSize.width)
            imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
            break
            
        case .TopRight:
            imagePoint.x -= (viewSize.width - imageSize.width)
            break
            
        case .BottomLeft:
            imagePoint.y -= (viewSize.height - imageSize.height)
            break
            
        case .BottomRight:
            imagePoint.x -= (viewSize.width - imageSize.width)
            imagePoint.y -= (viewSize.height - imageSize.height)
            break
            
        default: break
        }
        
        return imagePoint
    }
}