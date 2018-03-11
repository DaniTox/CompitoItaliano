//
//  RisultatiVC.swift
//  Italiano
//
//  Created by Dani Tox on 11/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class RisultatiVC: UIViewController {

    let model = EserciziModel()
    
    var resultLabel : UILabel!
    var resultsButton : UIButton!
    
    var voto : Int = 0 {
        didSet {
            if resultLabel != nil {
                resultLabel.text = "\(voto)/10"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Risultati"
        setViews()
        
        
        voto = model.calculateAnswers()
        print("Voto: \(voto)/10")
        
        let colors : [UIColor] = (voto >= 6) ? [.green, .yellow] : [.red, .yellow]
        view.applyGradient(colours: colors)
        
    }
    
    @objc private func showResults() {
        let vc = DetailResultVC()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
}

extension RisultatiVC {
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    private func setViews() {
        resultLabel = UILabel()
        resultLabel.backgroundColor = .blue
        resultLabel.layer.masksToBounds = true
        resultLabel.layer.cornerRadius = 10
        resultLabel.textAlignment = .center
        resultLabel.textColor = .white
        resultLabel.font = UIFont.boldSystemFont(ofSize: 70)
        view.addSubview(resultLabel)
        
        
        resultsButton = UIButton()
        resultsButton.setTitle("Guarda i risultati", for: .normal)
        resultsButton.backgroundColor = .purple
        resultsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        resultsButton.layer.masksToBounds = true
        resultsButton.layer.cornerRadius = 10
        resultsButton.addTarget(self, action: #selector(showResults), for: .touchUpInside)
        view.addSubview(resultsButton)
        
        
        resultsButton.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let stackView = UIStackView(arrangedSubviews: [resultLabel, resultsButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        
        
//        resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
//        resultLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        resultLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        navigationItem.hidesBackButton = true
        let fineButton = UIBarButtonItem(title: "Fine", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.setRightBarButton(fineButton, animated: true)
        
        
    }
}
