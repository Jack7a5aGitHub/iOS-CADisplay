//
//  ViewController.swift
//  CADisplayLink
//
//  Created by Jack Wong on 2018/06/21.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countingLabel: UILabel!
    var startValue: Double = 0
    let endValue: Double = 12000
    let animationDuration: Double = 5
    
    let animationStartDate = Date()
    
    let startText = ""
    let endText = "Measuring programming progress by lines of code is like measuring aircraft building progress by weight."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countingLabel.text = "1234"
        countingLabel.textAlignment = .center
        countingLabel.font = UIFont.boldSystemFont(ofSize: 18)

        // create my CADisplay
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .defaultRunLoopMode)
    }
    
    @objc func handleUpdate(){
        let now = Date()
        let startTextCount = Double(startText.count)
        let endTextCount = Double(endText.count)
        let elapseTime = now.timeIntervalSince(animationStartDate)
        
        if elapseTime > animationDuration {
            self.countingLabel.text = endText
        }
        else {
        let percentage = elapseTime / animationDuration
        
        let value = Int(percentage * (endTextCount - startTextCount))
        let str = endText.prefix(value)
            
        self.countingLabel.text = "\(str)"
        }
//        self.countingLabel.text = "\(startValue)"
//        startValue += 1
//        if startValue > endValue {
//            startValue = endValue
//        }
    }
    
    

}

