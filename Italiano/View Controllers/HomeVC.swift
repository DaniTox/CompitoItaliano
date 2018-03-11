//
//  ViewController.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class HomeVC : UIViewController {
    
    var button1 : UIButton?
    var buttonEsercizi : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
    @objc func segueToTeoria() {
        let vc = TeoriaVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func segueToEsercizi() {
        let vc = EserciziArgomentiVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func showCrediti() {
        let nav = UINavigationController(rootViewController: CreditiVC())
        present(nav, animated: true)
    }
}

extension HomeVC {
    func setViews() {
        navigationItem.title = "Home"
        view.backgroundColor = .blue
        view.applyGradient(colours: [.blue, .purple])
        
        button1 = UIButton(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        button1?.backgroundColor = .red
        button1?.setTitle("Teoria", for: .normal)
        button1?.layer.cornerRadius = 10
        button1?.addTarget(self, action: #selector(segueToTeoria), for: .touchUpInside)
        button1?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        view.addSubview(button1!)
        button1?.center.y = view.center.y
        
        buttonEsercizi = UIButton()
        buttonEsercizi.backgroundColor = .orange
        buttonEsercizi.setTitle("Esercizi", for: .normal)
        buttonEsercizi.layer.cornerRadius = 10
        buttonEsercizi.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        buttonEsercizi.addTarget(self, action: #selector(segueToEsercizi), for: .touchUpInside)
        view.addSubview(buttonEsercizi)
        
        
        let stackView = UIStackView(arrangedSubviews: [button1!, buttonEsercizi])
        //DA CONTINUARE
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 200).isActive =  true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .white
        button.setTitle("Crediti", for: .normal)
        button.addTarget(self, action: #selector(showCrediti), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}


