//
//  DateHeaderView.swift
//  Components
//
//  Created by Gustavo Henrique Frota Soares on 13/04/21.
//

import UIKit


final class DateHeaderView: UIView, ViewConfigureProtocol {

    //MARK: - Components
    private(set) lazy var titleLabel: UILabel = {

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


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewHierarchy()
        configureConstraints()
        configureView()
    }

    func configureViewHierarchy() {
        addSubview(titleLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.space01),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.space01),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configureView() {
        backgroundColor = UIColor.quaternarySystemFill
    }

}
