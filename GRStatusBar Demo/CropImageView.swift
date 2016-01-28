//
//  CropImageView.swift
//  GRStatusBar Demo
//
//  Created by Guilherme Rambo on 28/01/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Cocoa

class CropImageView: NSView {

    var image: NSImage? {
        didSet {
            setNeedsDisplayInRect(bounds)
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        guard let image = image else { return }
        
        image.drawInRect(bounds, fromRect: bounds, operation: .CompositeSourceOver, fraction: 1.0)
    }
    
}
