//
//  DTColorPickerImageView.swift
//
//  Created by Darktt on 15/11/20.
//  Copyright © 2015年 Darktt. All rights reserved.
//

import UIKit

public typealias DTColorPickerHandler = (color: UIColor) -> Void

@objc public protocol DTColorPickerImageViewDelegate: NSObjectProtocol
{
    optional func imageView(imageView: DTColorPickerImageView, didPickColorWithColor color: UIColor) -> Void
}

public class DTColorPickerImageView: UIImageView
{
    @IBOutlet weak public var delegate: DTColorPickerImageViewDelegate?
    
    private var handler: DTColorPickerHandler?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        self.userInteractionEnabled = true
    }
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.userInteractionEnabled = true
    }
    
    public override init(image: UIImage?)
    {
        super.init(image: image)
        
        self.userInteractionEnabled = true
    }
    
    private override init(image: UIImage?, highlightedImage: UIImage?)
    {
        super.init(image: image, highlightedImage: highlightedImage)
    }

    public required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     When handler and delegate not nil, will respondes handler first.
     
     - parameter handler: The hander for respondes.
     */
    public func handlesDidPickColor(handler: DTColorPickerHandler?) -> Void
    {
        self.handler = handler
    }
    
    //MARK: - Touch events
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let _ = touches.first else {
            return
        }
        
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.locationInView(self)
        
        self.pickerColor(atPoint: location)
    }
    
    public override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let _ = touches.first else {
            return
        }
        
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.locationInView(self)
        
        // Respondes when point in self bounds.
        if (!CGRectContainsPoint(self.bounds, location)) {
            return
        }
        
        self.pickerColor(atPoint: location)
    }
    
    // MARK: Private Method
    
    private func pickerColor(atPoint point: CGPoint) -> Void
    {
        guard let _ = self.image else {
            return
        }
        
        let convertPoint: CGPoint = self.image!.convertPoint(point, fromImageView: self)
        
        let color: UIColor = self.image!.pickColor(fromPoint: convertPoint)
        
        if let handler = self.handler {
            handler(color: color)
            return
        }
        
        if let delegate = self.delegate {
            if delegate.respondsToSelector("imageView:didPickColorWithColor:") {
                delegate.imageView!(self, didPickColorWithColor: color)
            }
        }
    }
}