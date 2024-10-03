//
//  DetailViewController.swift
//  JOSNSwiftDemo
//
//  Created by Shinkangsan on 1/23/17.
//  Copyright © 2017 Sheldon. All rights reserved.
//
import UIKit

@available(iOS 11.0, *)
class DetailViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 1
        return label
    }()

    private let dobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()

    private let mapButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver Mapa", for: .normal)
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "map"), for: .normal)
        } else {
            // Fallback on earlier versions
        } // Asegúrate de que el ícono esté en el SF Symbols
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        return button
    }()

    var nameString: String!
    var dobString: String!
    var imageString: String!
    var latitude: Double = 0.0
    var longitude: Double = 0.0 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"
        setupViews()
        updateUI()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(dobLabel)
        view.addSubview(mapButton) // Agregar el botón a la vista

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            dobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dobLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            mapButton.topAnchor.constraint(equalTo: dobLabel.bottomAnchor, constant: 20),
            mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func updateUI() {
        nameLabel.text = "Name : " + nameString
        dobLabel.text = "Age : " + dobString
        imageView.image = UIImage(named: imageString)
    }

    @objc private func showMap() {
        let mapVC = MapViewController()
        mapVC.latitude = latitude // Asigna la latitud
        mapVC.longitude = longitude // Asigna la longitud
        navigationController?.pushViewController(mapVC, animated: true)
    }
}
