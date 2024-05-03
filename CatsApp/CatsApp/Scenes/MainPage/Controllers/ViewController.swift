//
//  ViewController.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - properties
    let mainView = UIView()
    
    let textFieldForLenght = UITextField()
    
    let buttonForNextPage = UIButton()
    
    let coordinator: MainCoordinatorDelegate
    
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
        setUpTextFieldForLenght()
        setUpButtonForNextPage()
    }

    //MARK: - setUpMainView
    func setUpMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        mainView.backgroundColor = UIColor(named: "LightPink")
    }
    
    //MARK: - setUpTextFieldForLenght
    func setUpTextFieldForLenght () {
        textFieldForLenght.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(textFieldForLenght)
        textFieldForLenght.isUserInteractionEnabled = true
        textFieldForLenght.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        textFieldForLenght.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        textFieldForLenght.placeholder = "Enter text here"
        textFieldForLenght.textAlignment = .left
        textFieldForLenght.backgroundColor = .white
        textFieldForLenght.layer.cornerRadius = 8
        textFieldForLenght.layer.borderWidth = 1
        textFieldForLenght.layer.borderColor = UIColor.gray.cgColor
        textFieldForLenght.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textFieldForLenght.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

    //MARK: - setUpButtonForNextPage
    func setUpButtonForNextPage() {
        buttonForNextPage.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(buttonForNextPage)
        buttonForNextPage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        buttonForNextPage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonForNextPage.isUserInteractionEnabled = true
        buttonForNextPage.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        buttonForNextPage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        buttonForNextPage.setTitle("Show fact", for: .normal)
        buttonForNextPage.setTitleColor(.white, for: .normal)
        buttonForNextPage.backgroundColor = UIColor.gray
        buttonForNextPage.layer.cornerRadius = 10
        buttonForNextPage.addTarget(self, action: #selector(showFactButtonTapped), for: .touchUpInside)
    }

    @objc func showFactButtonTapped() {
        coordinator.navigateToFactScreen()
    }

 
}

