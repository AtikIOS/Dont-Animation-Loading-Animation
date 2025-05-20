//
//  PulseView.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class PulseView: UIView {

    private var pulseLayer: CAShapeLayer = CAShapeLayer()
    private var animationGroup: CAAnimationGroup?

    private var isSetupDone = false

    override func layoutSubviews() {
        super.layoutSubviews()
        if !isSetupDone {
            setupLayer()
            isSetupDone = true
        }
    }

    private func setupLayer() {
        let diameter = min(bounds.width, bounds.height)
        let circularPath = UIBezierPath(
            ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)
        )

        pulseLayer.path = circularPath.cgPath
        pulseLayer.fillColor = UIColor.white.withAlphaComponent(0.8).cgColor
        pulseLayer.opacity = 0
        pulseLayer.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        layer.addSublayer(pulseLayer)
    }

    func startPulsing() {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 2.0

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.7
        opacityAnimation.toValue = 0.0

        let group = CAAnimationGroup()
        group.animations = [scaleAnimation, opacityAnimation]
        group.duration = 1.2
        group.repeatCount = .infinity
        group.timingFunction = CAMediaTimingFunction(name: .easeOut)

        pulseLayer.add(group, forKey: "pulse")
        animationGroup = group
    }

    func stopPulsing() {
        pulseLayer.removeAnimation(forKey: "pulse")
    }
}
