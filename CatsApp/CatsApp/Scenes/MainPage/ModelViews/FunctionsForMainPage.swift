//
//  FunctionsForMainPage.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func navigateToFactScreen()
}

class FunctionsForMainPage: MainCoordinatorDelegate {
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func navigateToFactScreen() {
        let factViewController = FactViewController()
        viewController?.navigationController?.pushViewController(factViewController, animated: true)
    }
}
