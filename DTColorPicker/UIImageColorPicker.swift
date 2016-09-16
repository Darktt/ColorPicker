//
//  UIImageColorPicker.swift
//
//  Created by Darktt on 15/11/20.
//  Copyright © 2015年 Darktt. All rights reserved.
//

import UIKit

public extension UIImage
{
    public func pickColor(at point: CGPoint) -> UIColor
    {
        guard let cgImage = self.cgImage else {
            
            return UIColor.black
        }
        
        var color = UIColor.black
        
        let width: Int = cgImage.width
        let height: Int = cgImage.height
        
        let x: Int = Int(floor(point.x) * self.scale)
        let y: Int = Int(floor(point.y) * self.scale)
        
        if (x < width) && (y < height) {
            let provider: CGDataProvider = cgImage.dataProvider!
            
            if let bitmapData: CFData = provider.data {
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
    
    public func convertPoint(_ point: CGPoint, from imageView: UIImageView) -> CGPoint
    {
        var imagePoint: CGPoint = point
        
        let imageSize: CGSize = self.size
        let viewSize: CGSize = imageView.bounds.size
        
        let ratioX: CGFloat = viewSize.width / imageSize.width
        let ratioY: CGFloat = viewSize.height / imageSize.height
        
        let contentMode: UIViewContentMode = imageView.contentMode
        
        switch contentMode {
        case .scaleToFill, .redraw:
            imagePoint.x /= ratioX
            imagePoint.y /= ratioY
            break
            
        case .scaleAspectFill, .scaleAspectFit:
            var scale: CGFloat = 0
            
            if case .scaleAspectFit = contentMode {
                
                scale = min(ratioX, ratioY)
            }
            
            if case .scaleAspectFill = contentMode {
                
                scale = max(ratioX, ratioY)
            }
            
            // Remove the x or y margin added in FitMode
            imagePoint.x -= (viewSize.width - imageSize.width * scale) / 2.0
            imagePoint.y -= (viewSize.height - imageSize.height * scale) / 2.0
            imagePoint.x /= scale
            imagePoint.y /= scale
            
            break
            
        case .center:
            imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
            imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
            break
            
        case .top:
            imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
            break
            
        case .bottom:
            imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
            imagePoint.y -= (viewSize.height - imageSize.height)
            break
            
        case .left:
            imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
            break
            
        case .right:
            imagePoint.x -= (viewSize.width - imageSize.width)
            imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
            break
            
        case .topRight:
            imagePoint.x -= (viewSize.width - imageSize.width)
            break
            
        case .bottomLeft:
            imagePoint.y -= (viewSize.height - imageSize.height)
            break
            
        case .bottomRight:
            imagePoint.x -= (viewSize.width - imageSize.width)
            imagePoint.y -= (viewSize.height - imageSize.height)
            break
            
        default: break
        }
        
        return imagePoint
    }
}
