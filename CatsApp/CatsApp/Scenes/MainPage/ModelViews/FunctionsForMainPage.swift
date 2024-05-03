//
//  FunctionsForMainPage.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func navigateToFactScreen(with length: Int)
}

class FunctionsForMainPage: NSObject {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    private let networkingService = NetworkingService()
    
    // MARK: - Initialization
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Fact Handling
    
    func handleFetchedData() -> String {
        return networkingService.getFact() ?? "Undefined"
    }
    
    // MARK: - Navigation
    
    func navigateToFactScreen(with length: Int) {
        networkingService.setLength(length)
        let factViewController = FactViewController(functionsForMainPage: self)
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(factViewController, animated: true)
        }
    }
}
