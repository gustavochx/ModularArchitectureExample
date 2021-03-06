//
//  HistoricalViewController.swift
//  ModularArchitectureExample
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import UIKit
import Core
import Components

protocol HistoricalDisplay: AnyObject {
    func displayTodayValue(today: (String, String))
    func displayHistorical(list: [(String, String)])
    func displayError(message: String)
}

final class HistoricalViewController: UIViewController {
    // MARK: - Visual Components
    private lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.primary
        tableView.separatorStyle = .none

        tableView.register(
            CriptoCurrencyTableViewCell.self,
            forCellReuseIdentifier: String(describing: CriptoCurrencyTableViewCell.self)
        )
        return tableView
    }()

    // MARK: - Variables
    private let interactor: HistoricalInteracting
    private var todayTimer: Timer?
    private var list: [(String, String)] = [] {
        didSet {
            listTableView.reloadData()
        }
    }

    // MARK: - Life Cycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(interactor: HistoricalInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewHierarchy()
        configView()
        configConstraints()
        LoaderView.show(on: self.view, animated: true)
        interactor.updateCriptoCurrencyHistoricalList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todayTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { [weak self] _ in
            self?.interactor.updateCurrentValue()
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        todayTimer?.invalidate()
    }

    func configViewHierarchy() {
        view.addSubview(listTableView)
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.topAnchor, constant: Spacing.space02),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func configView() {
        navigationController?.navigationBar.barTintColor = UIColor.primary
        navigationController?.navigationBar.backgroundColor = UIColor.primary
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.quaternaryLabel]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Week"
        view.backgroundColor = UIColor.primary
    }
}

// MARK: - HistoricalDisplay
extension HistoricalViewController: HistoricalDisplay {
    func displayTodayValue(today: (String, String)) {
        list[0] = today
        listTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }

    func displayHistorical(list: [(String, String)]) {
        LoaderView.hide(on: self.view, animated: true)
        self.list = list
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate
extension HistoricalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.detailSelection(indexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension HistoricalViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard !list.isEmpty else { return 1 }
        return list.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard !list.isEmpty else {
            return nil
        }
        let day: (date: String, value: String) = list[section]
        let view = DateHeaderView(frame: .zero)
        view.titleLabel.text = day.date
        return view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if list.isEmpty {
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.primary
            cell.textLabel?.textColor = UIColor.quaternary
            cell.textLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            cell.textLabel?.text = "No content available"
            return cell

        } else if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CriptoCurrencyTableViewCell.self)) as? CriptoCurrencyTableViewCell {
            let day: (date: String, value: String) = list[indexPath.section]
            cell.selectionStyle = .none
            cell.titleLabel.text = "1 Btc"
            cell.rateLabel.text = day.value
            cell.lineView.isHidden = true
            return cell
        }
        return UITableViewCell()
    }
}
