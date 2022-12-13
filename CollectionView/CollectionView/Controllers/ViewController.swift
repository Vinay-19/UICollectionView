//
//  ViewController.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-08.
//

import UIKit
import SDWebImage


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var randColor:[UIColor] = []
    
    var networkManager = NetworkManager()
    
    var empUserResponse = [EmployeeDetails]()

    var empFullName = ""
    var empEmailAdd = ""
    var empPhotoUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        getRandomColor()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        networkManager.delegate = self
        networkManager.performRequest()
        
        
    }

    private func getRandomColor()  {
        for _ in 0...30 {
            let randomColor = UIColor.getRandomColor()
            self.randColor.append(randomColor)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! SecondViewController
        destVC.color = sender as? UIColor
    }
}

// MARK: - NetworkManagerDelegate

extension ViewController: NetworkManagerDelegate{

    func didUpdateEmployeeDetails(empData: Employees) {
        self.empUserResponse = empData.employees
        print(self.empUserResponse)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func didFailedWithError(error: Error) {
        print(error)
    }


}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.empUserResponse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let url = self.empUserResponse[indexPath.row].photo_url_small
        let empName = self.empUserResponse[indexPath.row].full_name
        cell.configure(with: url, empFullName: empName)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = self.randColor[indexPath.row]
        performSegue(withIdentifier: "goTo", sender: color)
//        print("You tapped me!!!!!")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
