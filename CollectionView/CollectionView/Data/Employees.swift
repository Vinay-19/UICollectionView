//
//  Model.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-12.
//

import Foundation

struct Employees: Codable {
    let employees: [EmployeeDetails]
}

struct EmployeeDetails: Codable {
    let full_name: String
    let email_address: String
    let photo_url_small: String
    
}
