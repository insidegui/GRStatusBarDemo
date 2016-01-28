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
    
    private var pictureProvider = DesktopPicturesProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeImage(nil)
    }
    
    @IBAction func changeImage(sender: AnyObject?) {
        imageView.image = pictureProvider.randomPicture
    }
    
    override func viewDidAppear() {
        view.window?.backgroundColor = NSColor.whiteColor()
        view.window?.statusBar.text = "Hello, world!"
        textField.stringValue = "Hello, world!"
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var stylePopUp: NSPopUpButton!
    @IBOutlet weak var backgroundColorWell: NSColorWell!

    @IBAction func setText(sender: NSTextField) {
        view.window?.statusBar.text = textField.stringValue
    }
    @IBAction func showForDefaultDuration(sender: NSButton) {
        view.window?.statusBar.show()
    }
    @IBAction func showIndefinitely(sender: NSButton) {
        view.window?.statusBar.show(forDuration: 0.0)
    }
    @IBAction func hide(sender: NSButton) {
        view.window?.statusBar.hide()
    }
    @IBAction func setStyle(sender: NSPopUpButton) {
        guard let wantedStyle = stylePopUp.selectedItem?.title else { return }

        view.window?.statusBar.style = GRStatusBarStyle(rawValue: wantedStyle)!
    }
    @IBAction func setBackgroundColor(sender: NSColorWell) {
        view.window?.statusBar.backgroundColor = backgroundColorWell.color
    }
}

