//
//  DateHeaderView.swift
//  Components
//
//  Created by Gustavo Henrique Frota Soares on 13/04/21.
//

import UIKit


public final class DateHeaderView: UIView, ViewConfigureProtocol {

    //MARK: - Components
    public lazy var titleLabel: UILabel = {

        var titleLabel = UILabel()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = UIColor.quaternaryLabel
        titleLabel.textAlignment = .center

        return titleLabel
    }()

    //MARK: - Lifecycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }


    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewHierarchy()
        configureConstraints()
        configureView()
    }

    public func configureViewHierarchy() {
        addSubview(titleLabel)
    }

    public func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.space01),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.space01),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    public func configureView() {
        backgroundColor = UIColor.quaternarySystemFill
    }

}
