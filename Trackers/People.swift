//
//  People.swift
//  Trackers
//
//  Created by Jose David Bustos H on 28-03-18.
//  Copyright © 2018 Sheldon. All rights reserved.
//
import Foundation

struct Person {
    let id: Int
    let firstName: String
    let lastName: String
    let profilePhoto: String
    let age: Int
    let sex: String
    let phone: String
    let latitude: Double
    let longitude: Double
}

let peopleList: [Person] = [
    Person(id: 1, firstName: "Juan", lastName: "Pérez", profilePhoto: "profile1", age: 30, sex: "Masculino", phone: "555-1234", latitude: 19.4326, longitude: -99.1332),
    Person(id: 2, firstName: "María", lastName: "González", profilePhoto: "profile2", age: 25, sex: "Femenino", phone: "555-5678", latitude: 34.6037, longitude: -58.3816),
    Person(id: 3, firstName: "Luis", lastName: "Martínez", profilePhoto: "profile3", age: 35, sex: "Masculino", phone: "555-9101", latitude: 40.7128, longitude: -74.0060),
    Person(id: 4, firstName: "Ana", lastName: "Sánchez", profilePhoto: "profile4", age: 28, sex: "Femenino", phone: "555-1213", latitude: 51.5074, longitude: -0.1278),
    Person(id: 5, firstName: "Carlos", lastName: "Rodríguez", profilePhoto: "profile5", age: 40, sex: "Masculino", phone: "555-1415", latitude: 48.8566, longitude: 2.3522),
    Person(id: 6, firstName: "Laura", lastName: "López", profilePhoto: "profile6", age: 32, sex: "Femenino", phone: "555-1617", latitude: 35.6895, longitude: 139.6917),
    Person(id: 7, firstName: "Jorge", lastName: "Hernández", profilePhoto: "profile7", age: 29, sex: "Masculino", phone: "555-1819", latitude: -33.4489, longitude: -70.6693),
    Person(id: 8, firstName: "Patricia", lastName: "Jiménez", profilePhoto: "profile8", age: 36, sex: "Femenino", phone: "555-2021", latitude: -23.5505, longitude: -46.6333),
    Person(id: 9, firstName: "Pedro", lastName: "Morales", profilePhoto: "profile9", age: 31, sex: "Masculino", phone: "555-2223", latitude: 37.7749, longitude: -122.4194),
    Person(id: 10, firstName: "Elena", lastName: "Cruz", profilePhoto: "profile10", age: 27, sex: "Femenino", phone: "555-2425", latitude: 55.7558, longitude: 37.6173)
]
