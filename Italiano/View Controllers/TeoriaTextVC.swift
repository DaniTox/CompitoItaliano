//
//  TeoriaTextVC.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import UIKit

class TeoriaTextVC : UIViewController {
    
    var titolo : UILabel!
    var textView : UITextView!
    var argomentoSelezionato : Argomento?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setViews()
        titolo.text = argomentoSelezionato?.titolo
    }
    
    var testo : String {
        get {
            return UserDefaults.standard.string(forKey: "teoria") ?? "NULL"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "teoria")
        }
    }
    
    private func setViews() {
        titolo = UILabel()
        titolo.textAlignment = .center
        titolo.backgroundColor = .clear
        titolo.font = UIFont.boldSystemFont(ofSize: 32)
        titolo.textColor = .white
        view.addSubview(titolo)
        
        
        textView = UITextView()
        textView.text = argomentoSelezionato?.body
        textView.textColor = .white
        textView.font = UIFont.preferredFont(forTextStyle: .body).withSize(25)
        textView.backgroundColor = .yellow
        textView.isEditable = true
        textView.delegate = self
        textView.showsVerticalScrollIndicator = true
        textView.isScrollEnabled = true
        textView.scrollRangeToVisible(NSMakeRange(0, 0))
        textView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        
        view.addSubview(textView)
        
        setConstraints()
        
        textView.text = testo
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if textView != nil  {
            textView.applyGradient(colours: [.purple,.blue] )
        }
        
    }
    
    
    private func setConstraints() {
        titolo.translatesAutoresizingMaskIntoConstraints = false
        titolo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titolo.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titolo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titolo.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: titolo.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

extension TeoriaTextVC : UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        testo = textView.text
        print("edited")
    }
}
