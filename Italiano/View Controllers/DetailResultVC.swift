//
//  DetailResultVC.swift
//  Italiano
//
//  Created by Dani Tox on 11/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class DetailResultVC: UIViewController {

    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(colours: [.blue, .purple])
        navigationItem.title = "Risultati"
        setViews()
    }

    


}

extension DetailResultVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == 0 {
            cell.textLabel?.text = esercizi[indexPath.section].fraseGiusta
        } else {
            let parola = resultDict[indexPath.section]?.parola.uppercased()
            let frase = esercizi[indexPath.section].frase
            let fraseFinal = frase.replacingOccurrences(of: "[...]", with: parola!)
            cell.textLabel?.text = fraseFinal
            let fraseGiusta = esercizi[indexPath.section].fraseGiusta
            
            cell.backgroundColor = (fraseFinal == fraseGiusta) ? .green : .red
            
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return esercizi.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(describing: esercizi[section].id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
}


extension DetailResultVC {
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    private func setViews() {
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         padding: .zero,
                         size: .zero)
        
        let dismissButton = UIBarButtonItem(title: "Fine", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.setRightBarButton(dismissButton, animated: true)
        
    }
}
