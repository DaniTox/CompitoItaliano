//
//  CreditiVC.swift
//  Italiano
//
//  Created by Dani Tox on 12/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class CreditiVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(colours: [.blue, .purple])
        navigationItem.title = "Crediti"
        
        setViews()
    }

    private func setViews() {
        let label = UILabel()
        label.text = "Gruppo UNIX:\n\nDaniel Bazzani\nLorenzo Salerno\nGabriele Crescini\nDavide Zanetti\n\n\nCopyright © 2018 Dani Tox."
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 500).isActive = true
        label.widthAnchor.constraint(equalToConstant: 500).isActive = true
        
        
        let button = UIBarButtonItem(title: "Fine", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.setRightBarButton(button, animated: true)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
