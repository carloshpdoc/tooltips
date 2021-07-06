//
//  HintsOnboardingView.swift
//
//  Created by Carlos Henrique on 05/07/2021.
//

import UIKit

public class BallonView: UIView {
    
    public let descriptionText: String
    public weak var anchorView: UIView?
    public var onTap: (() -> Void)?

    public init(descriptionText: String, anchorView: UIView?) {
        self.descriptionText = descriptionText
        super.init(frame: .zero)
        self.anchorView = anchorView
        setupViews()
    }

    public required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    public func showOverlay() {
        UIView.animate(withDuration: 0.6) {
            self.alpha = 1
        }
    }

    public func hideOverlay(_ completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.6, animations: {
            self.alpha = 0
        }, completion: completion)
    }

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.text = descriptionText
        titleLabel.textColor = .systemGray
        titleLabel.isHidden = descriptionText.isEmpty
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bottom-arrow"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 8),
        ])
        return imageView
    }()

    private func setupViews() {
        alpha = 0

        guard let anchorView = self.anchorView,
              let parentView = anchorView.superview,
              let cloneView  = anchorView.snapshotView(afterScreenUpdates: false) else { return }

        let translatedOrigin = parentView.convert(anchorView.frame.origin, to: self)
        cloneView.frame = CGRect(origin: translatedOrigin, size: anchorView.bounds.size)
        
        containerView.addSubview(titleLabel)

        addSubview(backgroundView)
        addSubview(cloneView)
        addSubview(arrowImage)
        addSubview(containerView)

        let constraints = [
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            arrowImage.centerXAnchor.constraint(equalTo: cloneView.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: cloneView.topAnchor, constant: -20),
            arrowImage.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -1)
        ]
        
        NSLayoutConstraint.activate(constraints)
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapGesture(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func onTapGesture(_ sender: Any) {
        self.onTap?()
    }
}
