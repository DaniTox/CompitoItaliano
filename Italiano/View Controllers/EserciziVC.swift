//
//  EserciziVC.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class EserciziVC : UIViewController {
    
    var tableView : UITableView!
    
    var fraseLabel : UILabel!
    var continueButton : UIButton!
    
    let model = EserciziModel()
    
    var currentEx : Esercizio? {
        didSet {
            if let es = currentEx {
                fraseLabel.text = es.frase
                if model.isLastEx(index: es.id) {
                    DispatchQueue.main.async {
                        self.continueButton.setTitle("Fine", for: .normal)
                    }
                }
            } else {
                //ESERCIZI FINITI
                DispatchQueue.main.async {
                    let vc = RisultatiVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    private var currentAnswer : Opzione?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Esercizi"
        view.applyGradient(colours: [.red, .yellow])
        setViews()
        
        currentEx = model.getEx(currentIndex: nil, completion: nil)
        
        
    }
    
    private func nextEx() {
        currentEx = model.getEx(currentIndex: currentEx?.id, completion: nil)
    }
    
    
}


extension EserciziVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = opzioni[indexPath.row].parola
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opzioni.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let opzione = opzioni[indexPath.row]
        currentAnswer = opzione
    }
    
}


extension EserciziVC {
    @objc private func continueAction() {
        print("Button touched")
        if let answ = currentAnswer, let ex = currentEx {
            model.setMyAnswer(answ, for: ex)
            nextEx()
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}



extension EserciziVC {
    private func setViews() {
        
        fraseLabel = UILabel()
        fraseLabel.backgroundColor = .purple
        fraseLabel.font = UIFont.boldSystemFont(ofSize: 35)
        fraseLabel.textColor = .white
        fraseLabel.textAlignment = .center
        fraseLabel.layer.masksToBounds = true
        fraseLabel.adjustsFontSizeToFitWidth = true
        fraseLabel.layer.cornerRadius = 10
        view.addSubview(fraseLabel)
        
        let consegnaLabel = UILabel()
        consegnaLabel.backgroundColor = .red
        consegnaLabel.layer.cornerRadius = 10
        consegnaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        consegnaLabel.textColor = .white
        consegnaLabel.text = "Seleziona il connettivo corretto. N.B. i connettivi andranno al posto di [...]"
        consegnaLabel.textAlignment = .center
        view.addSubview(consegnaLabel)
        
        
        
        
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(tableView)
        
        
        
        
        consegnaLabel.translatesAutoresizingMaskIntoConstraints = false
        consegnaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        consegnaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        consegnaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        consegnaLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        continueButton = UIButton()
        continueButton.setTitle("Continua", for: .normal)
        continueButton.backgroundColor = .red
        continueButton.layer.cornerRadius = 10
        continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        view.addSubview(continueButton)
        
        
        
        fraseLabel.translatesAutoresizingMaskIntoConstraints = false
        fraseLabel.topAnchor.constraint(equalTo: consegnaLabel.bottomAnchor, constant: 20).isActive = true
        fraseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        fraseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        fraseLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: fraseLabel.bottomAnchor, constant: 15).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -15).isActive = true
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        
        let dismissButton = UIBarButtonItem(title: "Fine", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.setRightBarButton(dismissButton, animated: true)
        
        
    }
}
