//
//  FactViewController.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

class FactViewController: UIViewController {

    //MARK: - properties
    let mainView = UIView()
    
    var labelForFact = UILabel()
    
    //MARK: - viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainView()
        setUpLabelForFact()
    }
    
    //MARK: - setUpMainView
    func setUpMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        mainView.backgroundColor = UIColor(named: "LightPink")
    }
    
    //MARK: - setUpLabelForFact
    func setUpLabelForFact() {
        labelForFact.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(labelForFact)
        labelForFact.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        labelForFact.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        labelForFact.widthAnchor.constraint(equalToConstant: 300).isActive = true
        labelForFact.numberOfLines = 0
        labelForFact.textAlignment = .left
        labelForFact.font = UIFont.systemFont(ofSize: 18.0)
        labelForFact.textColor = UIColor.black
    }
    
    
    

}
