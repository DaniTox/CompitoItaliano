//
//  TeoriaVC.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class TeoriaVC : UIViewController {
    
    var tableView : UITableView!
    var argomenti : [Argomento] = [
        Argomento(titolo: "Connettivi", body: "Prova teoria connettivi"),
        Argomento(titolo: "Articoli", body: "Prova teoria articoli"),
        Argomento(titolo: "Discorsi diretti e indiretti", body : "Testo di prova per i discorsi diretti e indiretti")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Teoria"
        view.backgroundColor = .green
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
        //AGGIUNGERE LE VIEWS PRIMA DI QUESTA CHIAMATA
        setConstraints()
        
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        
        view.applyGradient(colours: [.blue, .purple])
        
    }
    
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}



extension TeoriaVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = TeoriaTextVC()
        vc.argomentoSelezionato = argomenti[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return argomenti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = argomenti[indexPath.row].titolo
        cell.backgroundColor = .clear
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
