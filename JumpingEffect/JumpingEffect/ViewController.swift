//
//  ViewController.swift
//  JumpingEffect
//
//  Created by shreya.bhatia on 24/10/19.
//  Copyright © 2019 shreya.bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Initial position of the soccer ball
    var originalPosition: CGFloat = 0.0
    
    @IBOutlet weak var soccerBall: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.originalPosition = self.soccerBall.frame.origin.y
    }

    @IBAction func didTapJump(_ sender: UIButton) {
        
        //change the value of withDuration to increase or decrease speed of ball
        UIView.animate(withDuration: 0.5, animations: {
            self.soccerBall.frame.origin.y -= 300
        }) { _ in
            UIView.animateKeyframes(withDuration: 0.4, delay: 0.1, options: [.autoreverse, .repeat], animations: {
                self.soccerBall.frame.origin.y += 300
            })
        }
    }
    
    @IBAction func didTapStop(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
            self.soccerBall.frame.origin.y = self.originalPosition
        }) {_ in
            self.view.subviews.forEach({$0.layer.removeAllAnimations()})
            self.view.layoutIfNeeded()
        }
    }
}

