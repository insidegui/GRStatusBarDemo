//
//  ViewController.swift
//  GRStatusBar Demo
//
//  Created by Guilherme Rambo on 27/01/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Cocoa
import GRStatusBar

class ViewController: NSViewController {

    @IBOutlet weak var imageView: CropImageView!
    
    fileprivate var pictureProvider = DesktopPicturesProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeImage(nil)
    }
    
    @IBAction func changeImage(_ sender: AnyObject?) {
        imageView.image = pictureProvider.randomPicture
    }
    
    override func viewDidAppear() {
        view.window?.backgroundColor = NSColor.white
        view.window?.statusBar.text = "Hello, world!"
        textField.stringValue = "Hello, world!"
    }

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var stylePopUp: NSPopUpButton!
    @IBOutlet weak var backgroundColorWell: NSColorWell!

    @IBAction func setText(_ sender: NSTextField) {
        view.window?.statusBar.text = textField.stringValue
    }
    @IBAction func showForDefaultDuration(_ sender: NSButton) {
        view.window?.statusBar.show()
    }
    @IBAction func showIndefinitely(_ sender: NSButton) {
        view.window?.statusBar.show(forDuration: 0.0)
    }
    @IBAction func hide(_ sender: NSButton) {
        view.window?.statusBar.hide()
    }
    @IBAction func setStyle(_ sender: NSPopUpButton) {
        guard let wantedStyle = stylePopUp.selectedItem?.title.lowercased() else { return }

        view.window?.statusBar.style = GRStatusBarStyle(rawValue: wantedStyle)!
    }
    @IBAction func setBackgroundColor(_ sender: NSColorWell) {
        view.window?.statusBar.backgroundColor = backgroundColorWell.color
    }
}

