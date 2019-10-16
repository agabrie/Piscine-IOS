//
//  Shape.swift
//  MotionCube
//
//  Created by abduraghmaan GABRIELS on 2019/10/16.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import Foundation
import UIKit
//enum Shapes :ShapeView{
//    case circle
//
//    var instance:ShapeView()
//}
class ShapeView :UIView{
    let size: CGFloat = 100.0
    var fillColor: UIColor!
    
    var animator=UIDynamicAnimator()
    var gravity=UIGravityBehavior()
    var collision=UICollisionBehavior()
    var behaviour = UIDynamicItemBehavior()
    var originalBounds: CGRect!
    
//    init(origin: CGPoint,animator: UIDynamicAnimator,gravity:UIGravityBehavior){
    init(origin: CGPoint,animator:UIDynamicAnimator, gravity:UIGravityBehavior, collision:UICollisionBehavior, behaviour:UIDynamicItemBehavior) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.backgroundColor = UIColor.clear
        self.center = origin
        self.fillColor = randomColor()
        initGestureRecognizers()
        self.animator = animator
        self.collision = collision
        self.gravity = gravity
        self.behaviour = behaviour
        
        self.originalBounds = CGRect(x: 0.0, y: 0.0, width: size, height: size)
//        animator.updateItem(usingCurrentState: self)
    }

    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate))
        addGestureRecognizer(rotationGR)
    }
    
    @objc func didPan(panGR: UIPanGestureRecognizer) {
      
        switch panGR.state {
        case .began:
            self.gravity.removeItem(panGR.view!);
        case .changed:
            panGR.view?.center = panGR.location(in: self.superview);
            self.animator.updateItem(usingCurrentState: panGR.view!);
        case .ended:
            self.gravity.addItem(panGR.view!);
        default:
            break ;
        }
        
    }
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {
         let view = pinchGR.view as! ShapeView;
        
        switch pinchGR.state {
        case .began:
            self.gravity.removeItem(view);
        case .changed:
            self.collision.removeItem(view);
            self.behaviour.removeItem(view);
            view.bounds.size.width = view.originalBounds.width * pinchGR.scale;
            view.bounds.size.height = view.originalBounds.height * pinchGR.scale;
            self.collision.addItem(view);
            self.behaviour.addItem(view);
            self.animator.updateItem(usingCurrentState: view);
        case .ended:
            view.originalBounds = view.bounds;
            self.gravity.addItem(view);
        default:
            break ;
        }
    }
    @objc func didRotate(rotationGR: UIRotationGestureRecognizer) {
     //https://stackoverflow.com/questions/46919158/moving-an-object-uiview-in-swift-with-gravity-collision-elasticity-already-set
       
        switch rotationGR.state {
        case .began:
            self.gravity.removeItem(rotationGR.view!);
        case .changed:
            self.collision.removeItem(rotationGR.view!);
            self.behaviour.removeItem(rotationGR.view!);
            rotationGR.view!.transform = rotationGR.view!.transform.rotated(by: rotationGR.rotation);
            rotationGR.rotation = 0;
            self.collision.addItem(rotationGR.view!);
            self.behaviour.addItem(rotationGR.view!);
            self.animator.updateItem(usingCurrentState: rotationGR.view!);
        case .ended:
            self.gravity.addItem(rotationGR.view!);
        default:
            break ;
        }
        
    }
    func randomColor() -> UIColor {
        let hue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
    }
    
    override func draw(_ rect: CGRect) {

//        let path = UIBezierPath(roundedRect: rect, cornerRadius: 0)
        let path = randomShape(rect)
//        UIColor.red.setFill()
        self.fillColor.setFill()
        path.fill()
    }
    
    func randomShape(_ rect:CGRect)->UIBezierPath{
        switch(arc4random_uniform(2))
        {
            case 0:
                return UIBezierPath(roundedRect: rect, cornerRadius: 0)
            default :
                return UIBezierPath(roundedRect: rect, cornerRadius: self.size/2)
        }
    }
}
//class Circle:ShapeView{
//    override init(origin:CGPoint){
//        super.init(origin: origin)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func draw(_ rect:CGRect){
//        let path = UIBezierPath(roundedRect: rect, cornerRadius: self.size/2)
////        UIColor.red.setFill()
//        self.fillColor.setFill()
//        path.fill()
//
//    }
//}
