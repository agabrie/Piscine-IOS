//
//  ViewController.swift
//  MotionCube
//
//  Created by abduraghmaan GABRIELS on 2019/10/16.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var shapes:[ShapeView] = []
    var select: ShapeView? = nil
    var animator: UIDynamicAnimator!
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    let behaviour = UIDynamicItemBehavior()
    let motionManager = CMMotionManager()
    let motionQueue = OperationQueue.main
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        self.view.addGestureRecognizer(tapGR)
        
        
//        let gPan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture))
//        view.addGestureRecognizer(gPan)
        
        
        animator = UIDynamicAnimator(referenceView: view)
        
        gravity.gravityDirection = CGVector(dx:0, dy: 0.8)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        behaviour.elasticity = 0.5
        animator.addBehavior(behaviour)
        
    }
    
    @objc func didTap(tapGR: UITapGestureRecognizer) {
        let tapPoint = tapGR.location(in: self.view)
        
        let shapeView = ShapeView(origin: tapPoint, animator: animator, gravity: gravity, collision: collision, behaviour: behaviour)
//        shapes.append(shapeView)
        self.view.addSubview(shapeView)
        gravity.addItem(shapeView)
        collision.addItem(shapeView)
        behaviour.addItem(shapeView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if motionManager.isAccelerometerAvailable {
            motionManager.deviceMotionUpdateInterval = 0.01
            motionManager.startDeviceMotionUpdates(to: motionQueue, withHandler: gravityUpdated as! CMDeviceMotionHandler)
        }
//        for shape in shapes{
//            animator.addBehavior(gravity)
//            animator.addBehavior(collision)
//        }
    }
    
//    @objc func panGesture(sender: UIPanGestureRecognizer) {
////        switch sender.state {
////        print("nananana")
////        case .began:
//            let tapLocation = sender.location(in: self.view)
//            for shape in shapes {
//                if (shape.frame.contains(tapLocation)) {
////                    select = shape
//                    self.view.bringSubviewToFront(shape)
//                    gravity.removeItem(shape)
//                    print("namaemnmane")
//                    var translation = sender.translation(in: shape)
//                    translation = translation.applying(shape.transform)
//                    shape.center.x += translation.x
//                    shape.center.y += translation.y
//                    sender.setTranslation(CGPoint.zero, in: shape)
//                    //                select!.center = sender.location(in: self.view)
//                    animator.updateItem(usingCurrentState: shape)
//                    gravity.addItem(shape)
//                }
//            }
////        default:
////            if select != nil {
//
////                select = nil
////            }
//        }
        
//        switch sender.state {
//            case .began:
//                let tapPoint = sender.location(in: self.view)
//                for shape in shapes{
//                    if((shape.frame.contains(tapPoint))){
//                        select = shape
//                        self.view.bringSubviewToFront(select!)
//                        gravity.removeItem(select!)
//                    }
//                }
//            case .changed:
//                if select != nil {
//                    select!.center = sender.location(in: self.view)
//                    animator.updateItem(usingCurrentState: select!)
//                }
//            default:
//                if select != nil {
//                    gravity.addItem(select!)
//                    select = nil
//                }
//        }
//    }

    override func viewWillDisappear(_ animated: Bool) {
        motionManager.stopDeviceMotionUpdates()
    }
    
    func gravityUpdated(motion: CMDeviceMotion!, error: NSError!) {
        if (error != nil) {
            NSLog("\(error)")
        }
        gravity.gravityDirection = CGVector(dx: motion.gravity.x,dy: motion.gravity.y)
    }
    
}
