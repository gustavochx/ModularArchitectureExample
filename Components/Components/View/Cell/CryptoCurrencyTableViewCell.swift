//
//  CryptoCurrencyTableViewCell.swift
//  Components
//
//  Created by Gustavo Henrique Frota Soares on 13/04/21.
//

import UIKit


public final class CryptoCurrencyTableViewCell: UITableViewCell, ViewConfigureProtocol {

    //MARK: - Visual Components
    private (set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .quaternaryLabel
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()

    private (set) lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .quaternaryLabel
        return label
    }()

    private (set) lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()

    //MARK: - Lifecycle
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not implemented")
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViewHierarchy()
        configureConstraints()
        configureView()
    }

    func configureView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(rateLabel)
        contentView.addSubview(lineView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.space03),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.space02),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.space02)
        ])

        NSLayoutConstraint.activate([
            rateLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.space02),
            rateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: Spacing.space01)
        ])

        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func configureViewHierarchy() {
        backgroundColor = .lightGray
    }
}
