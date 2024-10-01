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

    var nameString: String!
    var dobString: String!
    var imageString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        updateUI()
    }

    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(dobLabel)

       
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),

            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
           
            dobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dobLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }


    func updateUI() {
        nameLabel.text = "Name : " + nameString
        dobLabel.text = "Age : " +  dobString
        imageView.image = UIImage(named: imageString)
    }

}
