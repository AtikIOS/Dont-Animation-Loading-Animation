//
//  DotAnimationView.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class DotAnimationView: UIView {
    
    static var shared = DotAnimationView()
    
    let radius: CGFloat = 60
    let colors: [UIColor] = [.systemPurple, .systemRed, .systemYellow, .systemBlue, .systemGreen]
    var theta: CGFloat = 0
    var dots: [DotView] = []
    var displayLink: CADisplayLink?

    func startAnimating(vc: UIViewController) {
        dots.forEach { $0.removeFromSuperview() }
        dots.removeAll()

        displayLink?.invalidate()
        displayLink = nil

        self.frame = vc.view.bounds
        self.backgroundColor = .black

        if self.superview == nil {
            vc.view.addSubview(self)
        }

        vc.view.bringSubviewToFront(self)

        let centerX = bounds.midX
        let centerY = bounds.midY

        for (i, color) in colors.enumerated() {
            let offset = CGFloat(i) * (2 * .pi) / CGFloat(colors.count)
            for reverse in [false, true] {
                let dot = DotView(radius: radius, offset: offset, style: color, reverse: reverse)
                dot.center = CGPoint(x: centerX, y: centerY)
                self.addSubview(dot)
                dots.append(dot)
            }
        }

        displayLink = CADisplayLink(target: self, selector: #selector(updateDots))
        displayLink?.add(to: .main, forMode: .default)
    }



    @objc private func updateDots() {
        theta += (2 * .pi) / (60 * 2) // Full rotation in 2 seconds
        for dot in dots {
            dot.update(theta: theta)
        }
    }
    
    func stopAnimation() {
        displayLink?.invalidate()
        displayLink = nil
        dots.forEach { $0.removeFromSuperview() }
        dots.removeAll()
        self.removeFromSuperview()
    }

    
    deinit {
        displayLink?.invalidate()
    }
}
