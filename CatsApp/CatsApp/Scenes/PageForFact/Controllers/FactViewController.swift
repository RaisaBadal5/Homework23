//
//  FactViewController.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

class FactViewController: UIViewController {
    //MARK: - properties
    private let mainView = UIView()
    
    private let labelForFact = UILabel()
    
    private var functionsForMainPage: FunctionsForMainPage?
    
    // MARK: - Initialization
    init(functionsForMainPage: FunctionsForMainPage) {
        self.functionsForMainPage = functionsForMainPage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainView()
        setUpLabelForFact()
        fetchFactAndUpdateUI()
    }
    
    // MARK: - Networking
    private func fetchFactAndUpdateUI() {
        functionsForMainPage?.fetchData { [weak self] in
            DispatchQueue.main.async {
                self?.updateFact()
            }
        }
    }
    
    private func updateFact() {
        let fact = functionsForMainPage?.handleFetchedData() ?? "Undefined"
        labelForFact.text = fact
    }
    
    //MARK: - setUpMainView
    func setUpMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        mainView.backgroundColor = UIColor(named: "LightPink")
    }
    
    //MARK: - setUpLabelForFact
    func setUpLabelForFact() {
        labelForFact.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(labelForFact)
        NSLayoutConstraint.activate([
            labelForFact.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            labelForFact.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            labelForFact.widthAnchor.constraint(equalToConstant: 300)
        ])
        labelForFact.numberOfLines = 0
        labelForFact.textAlignment = .left
        labelForFact.font = UIFont.systemFont(ofSize: 18.0)
        labelForFact.textColor = UIColor.black
    }
}

