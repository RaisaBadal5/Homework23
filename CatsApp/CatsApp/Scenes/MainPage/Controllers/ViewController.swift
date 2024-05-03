//
//  ViewController.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    private let mainView = UIView()
    private let textFieldForLength = UITextField()
    private let buttonForNextPage = UIButton()
    private let coordinator: MainCoordinatorDelegate
    
    // MARK: - Initialization
    
    init(coordinator: MainCoordinatorDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainView()
        setUpTextFieldForLength()
        setUpButtonForNextPage()
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
    
    //MARK: - setUpTextFieldForLength
    func setUpTextFieldForLength () {
        textFieldForLength.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(textFieldForLength)
        textFieldForLength.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            textFieldForLength.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            textFieldForLength.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 100),
            textFieldForLength.widthAnchor.constraint(equalToConstant: 300),
            textFieldForLength.heightAnchor.constraint(equalToConstant: 50)
        ])
        textFieldForLength.placeholder = "Enter text here"
        textFieldForLength.textAlignment = .left
        textFieldForLength.backgroundColor = .white
        textFieldForLength.layer.cornerRadius = 8
        textFieldForLength.layer.borderWidth = 1
        textFieldForLength.layer.borderColor = UIColor.gray.cgColor
    }
    
    //MARK: - setUpButtonForNextPage
    func setUpButtonForNextPage() {
        buttonForNextPage.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(buttonForNextPage)
        NSLayoutConstraint.activate([
            buttonForNextPage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            buttonForNextPage.topAnchor.constraint(equalTo: textFieldForLength.bottomAnchor, constant: 20),
            buttonForNextPage.widthAnchor.constraint(equalToConstant: 120),
            buttonForNextPage.heightAnchor.constraint(equalToConstant: 30)
        ])
        buttonForNextPage.setTitle("Show fact", for: .normal)
        buttonForNextPage.setTitleColor(.white, for: .normal)
        buttonForNextPage.backgroundColor = UIColor.gray
        buttonForNextPage.layer.cornerRadius = 10
        buttonForNextPage.addTarget(self, action: #selector(showFactButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func showFactButtonTapped() {
        guard let lengthText = textFieldForLength.text, let length = Int(lengthText) else {
            return
        }
        
        coordinator.navigateToFactScreen(with: length)
    }
    
}

