//
//  ViewControlMenu.swift
//  Trackers
//
//  Created by Jose David Bustos H on 28-03-18.
//  Copyright © 2018 Sheldon. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class ViewControlMenu: UIViewController {
    
    
    
    let menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        return view
    }()
    
    var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    
    
    
    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupMenuView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupMenuView() {
        view.addSubview(menuView)

        leadingConstraint = menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -200)
        
        NSLayoutConstraint.activate([
            leadingConstraint,
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.tintColor = .white
        menuView.addSubview(profileImageView)

        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Bienvenido"
        welcomeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        welcomeLabel.textColor = .white
        menuView.addSubview(welcomeLabel)

        let navigateButton = UIButton(type: .system)
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.setTitle("Config", for: .normal)
        navigateButton.setTitleColor(.white, for: .normal)
        navigateButton.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        menuView.addSubview(navigateButton)

        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 160),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            
            navigateButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            navigateButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor)
        ])
    }
    
    func setupNavigationBar() {
        let menuImage = UIImage(systemName: "line.horizontal.3")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(menuAction))
    }

    @objc func menuAction() {
        leadingConstraint.constant = menuShowing ? -200 : 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        menuShowing.toggle()
    }
    
    @objc func navigateToNextScreen() {
//        let nextViewController = ConfigViewController()
//        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @IBAction func MenuAction(_ sender: Any) {
//        
//        if (menuSHowing)
//        {
//            LeadingContraint.constant = -200
//        }else{
//            LeadingContraint.constant = 0
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//            
//        }
//        menuSHowing = !menuSHowing
//    }
    
    
}

@available(iOS 13.0, *)
extension ViewControlMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            viewModel.deleteProduct(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

