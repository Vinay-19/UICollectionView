//
//  NetworkManager.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-12.
//

import Foundation

protocol NetworkManagerDelegate{
    
    func didUpdateEmployeeDetails(empData: Employees)
    func didFailedWithError(error: Error)
    
}


struct NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    func performRequest() {
        
        guard let url = URL.employeeListURL() else {
            return
        }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            if let safeData = data {
                if let decodedData = self.parseJson(empData: safeData) {
                    self.delegate?.didUpdateEmployeeDetails(empData: decodedData)
                }
            }
            
            if error != nil {
                self.delegate?.didFailedWithError(error: error!)
                return
            }
            
        }
        dataTask.resume()
    }
    
    func parseJson(empData: Data) -> Employees? {
        do{
            let decoder = JSONDecoder()
            let decodeData = try decoder.decode(Employees.self, from: empData)
            return decodeData
        }catch{
            self.delegate?.didFailedWithError(error: error)
            return nil
        }
    }
}
