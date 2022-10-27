//
//  TweetPresenter.swift
//  Tweet
//
//  Created by 민성홍 on 2022/10/27.
//

import Foundation

protocol TweetProtocol: AnyObject {
    func setViews(tweet: Tweet)
    func setupViews()
}

final class TweetPresenter {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet

    init(
        viewController: TweetProtocol,
        tweet: Tweet
    ) {
        self.viewController = viewController
        self.tweet = tweet
    }

    func viewDidLoad() {
        viewController?.setupViews()
        viewController?.setViews(tweet: tweet)
    }
}
