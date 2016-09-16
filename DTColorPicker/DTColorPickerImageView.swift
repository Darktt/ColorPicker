//
//  DTColorPickerImageView.swift
//
//  Created by Darktt on 15/11/20.
//  Copyright © 2015年 Darktt. All rights reserved.
//

import UIKit

public typealias DTColorPickerHandler = (_ color: UIColor) -> Void

@objc
public protocol DTColorPickerImageViewDelegate: NSObjectProtocol
{
    @objc 
    optional func imageView(_ imageView: DTColorPickerImageView, didPickColorWithColor color: UIColor) -> Void
}

public class DTColorPickerImageView: UIImageView
{
    @IBOutlet weak public var delegate: DTColorPickerImageViewDelegate?
    
    fileprivate var handler: DTColorPickerHandler?
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.isUserInteractionEnabled = true
    }
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
    }
    
    public override init(image: UIImage?)
    {
        super.init(image: image)
        
        self.isUserInteractionEnabled = true
    }
    
    private override init(image: UIImage?, highlightedImage: UIImage?)
    {
        super.init(image: image, highlightedImage: highlightedImage)
        
        self.isUserInteractionEnabled = true
    }

    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
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
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch: UITouch = touches.first else {
            return
        }
        
        let location: CGPoint = touch.location(in: self)
        
        self.pickerColor(at: location)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch: UITouch = touches.first else {
            return
        }
        
        let location: CGPoint = touch.location(in: self)
        
        // Respondes when point in self bounds.
        if (!self.bounds.contains(location)) {
            return
        }
        
        self.pickerColor(at: location)
    }
}

// MARK: - Private Methods -

fileprivate extension DTColorPickerImageView
{
    // MARK: Private Method
    
    func pickerColor(at point: CGPoint) -> Void
    {
        guard let image: UIImage = self.image else {
            return
        }
        
        let convertPoint: CGPoint = image.convertPoint(point, from: self)
        
        let color: UIColor = image.pickColor(at: convertPoint)
        
        if let handler = self.handler {
            handler(color)
            return
        }
        
        if let imageViewMethod = self.delegate?.imageView {
            
            imageViewMethod(self, color)
        }
    }
}
