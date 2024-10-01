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
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let people: [Person] = peopleList //productList.filter { $0.typeDevice == 1 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUX()
        setupNavigationBar()
        setupMenuView()
        
    }
    
    func setupUX() {
        view.backgroundColor = .white
        
        // Asegúrate de agregar el menuView primero
        view.addSubview(menuView)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupMenuView() {
        leadingConstraint = menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -200)
        view.addSubview(menuView)

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
        // Navegar a la siguiente pantalla
    }
}

@available(iOS 13.0, *)
extension ViewControlMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        let person = peopleList[indexPath.row]

        let image = UIImage(named: person.profilePhoto)
        let name = "\(person.firstName) \(person.lastName)"
        let dob = "\(person.age) años"
        
        cell.configureItems(with: image, name: name, dob: dob)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = DetailViewController()
        let selectedPerson = peopleList[indexPath.row]
        detailsVC.imageString = selectedPerson.profilePhoto
        detailsVC.nameString = selectedPerson.firstName + " " + selectedPerson.lastName
        detailsVC.dobString = "\(selectedPerson.age)"
        detailsVC.latitude = selectedPerson.latitude
        detailsVC.longitude = selectedPerson.longitude
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Manejar eliminación de filas
        }
    }
}
