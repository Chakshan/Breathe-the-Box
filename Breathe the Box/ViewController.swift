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
        if fillTopBarWidthConstraint.constant == 150 {
            fillTopBarWidthConstraint.constant = 0
            topBarView.backgroundColor = .systemTeal
            print("Top resetted")
        }
        if fillRightBarWidthConstraint.constant == 150 {
            fillRightBarWidthConstraint.constant = 0
            rightBarView.backgroundColor = .systemTeal
            print("Right resetted")
        }
        if fillBottomBarWidthConstraint.constant == 150 {
            fillBottomBarWidthConstraint.constant = 0
            bottomBarView.backgroundColor = .systemTeal
            print("Bottom resetted")
        }
        if fillLeftBarWidthConstraint.constant == 150 {
            fillLeftBarWidthConstraint.constant = 0
            leftBarView.backgroundColor = .systemTeal
            print("Left resetted")
        }
            
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

        newbox(bars: bars, fill: fill, index: 0, fillDur: 4, fadeDur: 1)
        
    }
    
    func box() {
        let fill = [fillTopBarWidthConstraint, fillRightBarWidthConstraint, fillBottomBarWidthConstraint, fillLeftBarWidthConstraint]
        
        let bars = [topBarView, rightBarView, bottomBarView, leftBarView]
        
        let fillDuration = 2
        let fadeDuration = 1
        var loopCount = 0
        
        for index in 0..<fill.count {
            
            print("Im here \(index)")
            UIView.animate(withDuration: TimeInterval(fillDuration), delay: TimeInterval(fillDuration * loopCount), options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .systemTeal
                fill[index]?.constant = 150
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            
            UIView.animate(withDuration: TimeInterval(fadeDuration), delay: TimeInterval(fillDuration * (loopCount + 1)), options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .white
                self.view.layoutIfNeeded()
            }, completion: {(done) in
                bars[index]?.backgroundColor = .systemTeal
                fill[index]?.constant = 0
//
                
                if index == fill.count - 1 {
                    self.box()
                }
                
                
            })
            
            loopCount += 1
            
            
        }
        
    }
    
    func newbox(bars: [UIView?], fill: [NSLayoutConstraint?], index: Int, fillDur: Double, fadeDur: Double) {
        
        UIView.animate(withDuration: fillDur, delay: 0, options: .curveLinear, animations: {
            //bars[index]?.backgroundColor = .systemTeal
            fill[index]?.constant = 150
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: fadeDur, delay: 0, options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .white
                self.view.layoutIfNeeded()
            }, completion: { (completed) in
                if completed {
                    print("completed")
                    fill[index]?.constant = 0
                    bars[index]?.backgroundColor = .systemTeal
                    print("set to 0 at index:", index)
                    self.newbox(bars: bars, fill: fill, index: (index + 1) % fill.count, fillDur: fillDur, fadeDur: fadeDur)
                }
            })
        })
    }
    
     func Nbox() {
        let fill = [fillTopBarWidthConstraint, fillRightBarWidthConstraint, fillBottomBarWidthConstraint, fillLeftBarWidthConstraint]
        
        let bars = [topBarView, rightBarView, bottomBarView, leftBarView]
        
        let fillDuration = 2
        let fadeDuration = 1
        var loopCount = 0
        
        for index in 0..<fill.count {
            
            print("Im here \(index)")
            UIView.animate(withDuration: TimeInterval(fillDuration), delay: 0, options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .systemTeal
                fill[index]?.constant = 150
                self.view.layoutIfNeeded()
            }, completion: { _ in
                print("completion ", index)
                UIView.animate(withDuration: TimeInterval(fadeDuration), delay: 0, options: .curveLinear, animations: {
                bars[index]?.backgroundColor = .white
                self.view.layoutIfNeeded()
                }, completion: nil)
            })
            
//               print("Sleeping....")
//               sleep(2)
            //fill[index]?.constant = 0
            loopCount += 1
                
            
        }
            
    }
    
    func boxy() {
        let fill = [fillTopBarWidthConstraint, fillRightBarWidthConstraint, fillBottomBarWidthConstraint, fillLeftBarWidthConstraint]
        
        let bars = [topBarView, rightBarView, bottomBarView, leftBarView]
        
        let fillDuration = 2.0
        let fadeDuration = 1.0
        
        for index in 0..<fill.count {
            bar(bar: bars[index], fill: fill[index], fillDur: fillDuration, fadeDur: fadeDuration)
            sleep(UInt32(fillDuration))
        }
    }
    
    func bar(bar: UIView?, fill: NSLayoutConstraint?, fillDur: Double, fadeDur: Double) {
        UIView.animate(withDuration: TimeInterval(fillDur), delay: 0, options: .curveLinear, animations: {
            bar?.backgroundColor = .systemTeal
            fill?.constant = 150
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: TimeInterval(fadeDur), delay: 0, options: .curveLinear, animations: {
            bar?.backgroundColor = .white
            self.view.layoutIfNeeded()
            }, completion: { _ in
                return
            })
        })
    }
        
        


}

