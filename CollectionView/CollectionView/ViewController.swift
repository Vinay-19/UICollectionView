//
//  ViewController.swift
//  CollectionView
//
//  Created by Vinay Kumar Thapa on 2022-12-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var randColor:[UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        getRandomColor()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
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



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.randColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//        cell.configure(with: UIImage(named: "photo")!)
        cell.collectionImgView.backgroundColor = self.randColor[indexPath.row]
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = self.randColor[indexPath.row]
        performSegue(withIdentifier: "goTo", sender: color)
//        print("You tapped me!!!!!")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
