//
//  FeedPresenter.swift
//  Tweet
//
//  Created by 민성홍 on 2022/10/26.
//

import UIKit

protocol FeedProtocol: AnyObject {
    func setupView()
    func reloadTableView()
    func moveToTweetViewController(with tweet: Tweet)
}

final class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol

    private var tweets: [Tweet] = []

    init(
        viewController: FeedProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController?.setupView()
    }

    func viewWillAppear() {
        tweets = userDefaultsManager.getTweet()
        viewController?.reloadTableView()
    }
}

extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell

        let tweet = tweets[indexPath.row]
        cell?.setup(tweet: tweet)

        return cell ?? UITableViewCell()
    }
}

extension FeedPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweet = tweets[indexPath.row]

        viewController?.moveToTweetViewController(with: tweet)
    }
}
