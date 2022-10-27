//
//  WritePresenter.swift
//  Tweet
//
//  Created by 민성홍 on 2022/10/27.
//

import Foundation

protocol WriteProtocol: AnyObject {
    func setupViews()
    func dismiss()
}

final class WritePresenter {
    private weak var viewController: WriteProtocol?

    private let userDefaultsManager: UserDefaultsManagerProtocol

    init(
        viewController: WriteProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController?.setupViews()
    }

    func didTapLeftBarButtonItem() {
        viewController?.dismiss()
    }

    func didTapRightBarButtonItem(text: String) {
        let tweet = Tweet(user: User.shared, contents: text)

        userDefaultsManager.setTweet(tweet)

        viewController?.dismiss()
    }
}
