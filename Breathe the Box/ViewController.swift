//
//  ViewController.swift
//  Breathe the Box
//
//  Created by Chakshan Kothakota on 7/18/20.
//  Copyright © 2020 Chakshan Kothakota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fillTopBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fillRightBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fillBottomBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fillLeftBarWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var rightBarView: UIView!
    @IBOutlet weak var bottomBarView: UIView!
    @IBOutlet weak var leftBarView: UIView!
    
    func reset() {
        fillTopBarWidthConstraint.constant = 0
        fillRightBarWidthConstraint.constant = 0
        fillBottomBarWidthConstraint.constant = 0
        fillLeftBarWidthConstraint.constant = 0
        topBarView.backgroundColor = .systemTeal
        rightBarView.backgroundColor = .systemTeal
        bottomBarView.backgroundColor = .systemTeal
        leftBarView.backgroundColor = .systemTeal
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        reset()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let fill = [fillTopBarWidthConstraint, fillRightBarWidthConstraint, fillBottomBarWidthConstraint, fillLeftBarWidthConstraint]
        
        let bars = [topBarView, rightBarView, bottomBarView, leftBarView]
        
        let fillDuration = 4
        let fadeDuration = 1
        var loopCount = 0
    
        for index in 0..<fill.count {
            UIView.animate(withDuration: TimeInterval(fillDuration), delay: TimeInterval(fillDuration * loopCount), options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .systemTeal
                fill[index]?.constant = 150
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            
            UIView.animate(withDuration: TimeInterval(fadeDuration), delay: TimeInterval(fillDuration * (loopCount + 1)), options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .white
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            loopCount += 1
            
            
            
        }
        
        
        
        
        
    }


}

