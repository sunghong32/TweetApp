//
//  FeedViewController.swift
//  Tweet
//
//  Created by 민성홍 on 2022/10/26.
//

import UIKit
import SnapKit
import Floaty

final class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)

    private lazy var writeButton: Floaty = {
        let float = Floaty(size: 50.0)
        float.sticky = true
        float.handleFirstItemDirectly = true
        float.addItem(title: "") { _ in
            print("Floaty!")
        }
        float.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)

        return float
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(
            FeedTableViewCell.self,
            forCellReuseIdentifier: FeedTableViewCell.identifier
        )

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.viewWillAppear()
    }
}

extension FeedViewController: FeedProtocol {
    func setupView() {
        navigationItem.title = "Feed"

        [tableView, writeButton]
            .forEach { view.addSubview($0) }

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        writeButton.paddingY = 100.0
    }

    func reloadTableView() {
        tableView.reloadData()
    }
}
