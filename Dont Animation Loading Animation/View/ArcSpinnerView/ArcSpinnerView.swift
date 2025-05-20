//
//  ArcSpinnerView.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class ArcSpinnerView: UIView {

    static let shared = ArcSpinnerView()
    
    private let arcLayer = CAShapeLayer()
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
        vc.view.addSubview(self)
        self.backgroundColor = .black
        
        let spinnerSize: CGFloat = 80
        let spinner = UIView(frame: CGRect(x: (bounds.width - spinnerSize)/2,
                                           y: (bounds.height - spinnerSize)/2,
                                           width: spinnerSize,
                                           height: spinnerSize))
        spinner.backgroundColor = .clear
        self.addSubview(spinner)

        // Spinner arc setup
        let radius: CGFloat = spinnerSize / 2 - 5
        let center = CGPoint(x: spinnerSize/2, y: spinnerSize/2)
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = .pi * 1.5
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        arcLayer.path = path.cgPath
        arcLayer.lineWidth = 6
        arcLayer.strokeColor = UIColor.systemTeal.cgColor
        arcLayer.fillColor = UIColor.clear.cgColor
        arcLayer.lineCap = .round
        arcLayer.frame = spinner.bounds
        spinner.layer.addSublayer(arcLayer)
        
        // Rotation animation
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = 1.0
        rotation.repeatCount = .infinity
        spinner.layer.add(rotation, forKey: "rotate")
    }

    func stopAnimating() {
        isAnimating = false
        self.subviews.forEach { $0.layer.removeAllAnimations(); $0.removeFromSuperview() }
        arcLayer.removeAllAnimations()
        self.removeFromSuperview()
    }
    
    deinit {
        arcLayer.removeAllAnimations()
    }
}
