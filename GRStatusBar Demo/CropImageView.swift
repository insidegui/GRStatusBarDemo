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
            setNeedsDisplay(bounds)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        guard let image = image else { return }
        
        image.draw(in: bounds, from: bounds, operation: .sourceOver, fraction: 1.0)
    }
    
}
