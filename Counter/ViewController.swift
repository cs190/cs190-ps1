//
//  ViewController.swift
//  Counter
//
//  Created by Brian Hill github.com/brianhill on 1/25/16.
//

import UIKit

import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var display: Display?
    
    var displayLink: CADisplayLink?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // displayLink = CADisplayLink(target:self, selector:Selector("prepareForVSync:"))
        // displayLink?.addToRunLoop(NSRunLoop.currentRunLoop(), forMode:NSRunLoopCommonModes)
        // displayLink?.paused = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        // displayLink?.paused = false
    }
    
    override func viewWillDisappear(animated:Bool) {
        // displayLink?.paused = true
        super.viewWillDisappear(animated)
    }
    
    // func prepareForVSync(sender: CADisplayLink) {
    // }
    
}
