//
//  PulseContainerView.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class PulseContainerView: UIView {

    private let pulse = PulseView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPulse()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPulse()
    }

    private func setupPulse() {
        backgroundColor =  .black

        pulse.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pulse)

        NSLayoutConstraint.activate([
            pulse.centerXAnchor.constraint(equalTo: centerXAnchor),
            pulse.centerYAnchor.constraint(equalTo: centerYAnchor),
            pulse.widthAnchor.constraint(equalToConstant: 100),
            pulse.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func startPulsing() {
        pulse.startPulsing()
    }

    func stopPulsing() {
        pulse.stopPulsing()
        removeFromSuperview()
    }

    // MARK: - Public Method to Add & Start
    static func startAnimating(vc: UIViewController) {
        let pulseView = PulseContainerView(frame: vc.view.bounds)
        vc.view.addSubview(pulseView)
        pulseView.startPulsing()
    }

    static func stopAnimating(vc: UIViewController) {
        if let pulseView = vc.view.subviews.first(where: { $0 is PulseContainerView }) as? PulseContainerView {
            pulseView.stopPulsing()
        }
    }
}
