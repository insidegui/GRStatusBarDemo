//
//  DesktopPicturesProvider.swift
//  GRStatusBar Demo
//
//  Created by Guilherme Rambo on 28/01/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Cocoa

class DesktopPicturesProvider {
    
    fileprivate let desktopPicturesFolder = "/Library/Desktop Pictures"
    fileprivate var desktopPictures = [String]()
    
    init() {
        let enumerator = FileManager.default.enumerator(atPath: desktopPicturesFolder)
        
        while let file = enumerator?.nextObject() as? NSString {
            guard !file.contains("thumbnail") else { continue }
            guard file.pathExtension == "jpg" else { continue }
            
            desktopPictures.append("\(desktopPicturesFolder)/\(file)")
        }
    }
    
    var randomPicture: NSImage {
        let index = Int(arc4random_uniform(UInt32(desktopPictures.count-1)))
        return NSImage(contentsOfFile: desktopPictures[index])!
    }
    
}
