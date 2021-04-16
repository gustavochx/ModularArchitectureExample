//
//  LoaderView.swift
//  Components
//
//  Created by Gustavo Henrique Frota Soares on 13/04/21.
//

import UIKit
import Core

public final class LoaderView: UIView, ViewConfigureProtocol {
    // MARK: - Visual Components
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.gray
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    // MARK: - Life Cycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewHierarchy()
        configureConstraints()
        configureView()
    }

    public func configureViewHierarchy() {
        addSubview(activityIndicator)
    }

    public func configureConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.heightAnchor.constraint(equalToConstant: 30),
            activityIndicator.widthAnchor.constraint(equalToConstant: 30),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    public func configureView() {
        backgroundColor = UIColor.secondary
    }

    // MARK: - Presentation
    public static func show(on view: UIView, animated: Bool) {
        let loader = LoaderView(frame: view.frame)
        loader.tag = 999
        if animated {
            loader.alpha = 0.0
            loader.alphaAnimation(to: 1.0, completion: nil)
        }
        view.addSubview(loader)
    }

    public static func hide(on view: UIView, animated: Bool) {
        guard let loader = view.viewWithTag(999) as? LoaderView else { return }
        if animated {
            loader.alphaAnimation(to: 0.0) {
                loader.removeFromSuperview()
            }
        } else {
            loader.removeFromSuperview()
        }
    }

    private func alphaAnimation(to finalValue: CGFloat, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.25) {
            self.alpha = finalValue
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = finalValue
        }) { _ in
            completion?()
        }
    }
}
