//
//  TailDotsView.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class TailDotsView: UIView {
    
    static let shared = TailDotsView()
    
    private var dotViews: [UIView] = []
    private var isAnimating = false
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating(vc: UIViewController) {
        guard !isAnimating else { return }
        isAnimating = true
        
        self.frame = vc.view.bounds
        self.backgroundColor = .black
        vc.view.addSubview(self)
        
        let numberOfDots = 6
        let dotSize: CGFloat = 16
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius: CGFloat = 40
        
        for i in 0..<numberOfDots {
            let dot = UIView(frame: CGRect(x: 0, y: 0, width: dotSize, height: dotSize))
            dot.backgroundColor = UIColor(hue: CGFloat(i)/CGFloat(numberOfDots), saturation: 0.8, brightness: 1, alpha: 1)
            dot.layer.cornerRadius = dotSize / 2
            dot.center = centerPoint
            addSubview(dot)
            dotViews.append(dot)
            
            animate(dot: dot, at: i, total: numberOfDots, center: centerPoint, radius: radius)
        }
    }
    
    private func animate(dot: UIView, at index: Int, total: Int, center: CGPoint, radius: CGFloat) {
        let delay = Double(index) * 0.1
        let duration: Double = 1.5
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        animation.duration = duration
        animation.beginTime = CACurrentMediaTime() + delay
        animation.repeatCount = .infinity
        animation.calculationMode = .paced
        
        dot.layer.add(animation, forKey: "tailOrbit")
    }
    
    func stopAnimating() {
        isAnimating = false
        dotViews.forEach { $0.layer.removeAllAnimations(); $0.removeFromSuperview() }
        dotViews.removeAll()
        self.removeFromSuperview()
    }
    
    deinit {
        dotViews.forEach { $0.layer.removeAllAnimations() }
    }
}
