//
//  DotView.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class DotView: UIView {
    var radius: CGFloat
    var offset: CGFloat
    var style: UIColor
    var reverse: Bool

    init(radius: CGFloat, offset: CGFloat, style: UIColor, reverse: Bool) {
        self.radius = radius
        self.offset = offset
        self.style = style
        self.reverse = reverse
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        backgroundColor = style
        layer.cornerRadius = 15
        layer.shadowColor = style.withAlphaComponent(0.3).cgColor
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 30)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(theta: CGFloat) {
        let adjustedTheta = reverse ? -(theta + .pi) : theta
        let scale = 0.5 + abs((adjustedTheta - .pi).truncatingRemainder(dividingBy: 2 * .pi)) / (2 * .pi)
        transform = CGAffineTransform.identity
            .translatedBy(
                x: radius * (cos(adjustedTheta + offset) + cos(offset)),
                y: radius * (sin(adjustedTheta + offset) + sin(offset))
            )
            .scaledBy(x: scale, y: scale)
            .rotated(by: reverse ? .pi : 0)
        layer.shadowOffset = CGSize(width: 0, height: 30 * scale)
    }
}
