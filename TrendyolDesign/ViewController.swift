//
//  ViewController.swift
//  TrendyolDesign
//
//  Created by EMRE on 3.09.2022.
//

import UIKit

class ViewController: UIViewController {
   
    var tabBarTag: Bool = true
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if tabBarTag == true {
            self .tabBarController?.tabBar.tintColor = UIColor.orange
        }else{
            self .tabBarController?.tabBar.tintColor = UIColor.blue

        }
                
    }
    
    @IBOutlet weak var hizmetlerCollectionView: UICollectionView!
    var hizmetlerListesi = [Hizmetler]()
    var imageListesi = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let h1 = Hizmetler(hizmet: "Hızlı Market", image: .init(named: "hizliMarket")!)
        let h2 = Hizmetler(hizmet: "Yemek", image: .init(named: "yemek")! )
        let h3 = Hizmetler(hizmet: "Al, Sat, Kazan", image: .init(named: "alsatkazan")! )
        let h4 = Hizmetler(hizmet: "Kategoriler", image: .init(named: "kategoriler")! )

        hizmetlerListesi.append(h1)
        hizmetlerListesi.append(h2)
        hizmetlerListesi.append(h3)
        hizmetlerListesi.append(h4)

        hizmetlerCollectionView.delegate = self
        hizmetlerCollectionView.dataSource = self

        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tasarim.minimumInteritemSpacing = 0
        tasarim.minimumLineSpacing = 0
        
        let genislik = UIScreen.main.bounds.width
        let itemGenislik = (genislik - 30) / 4
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik)
        hizmetlerCollectionView.collectionViewLayout = tasarim
    }
    
}
    
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hizmetlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hizmet = hizmetlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hizmetHucre", for: indexPath) as! HizmetCollectionViewCell
        cell.hizliMarketLabel.text = hizmet.hizmet
        cell.hizliMarketImage.image = hizmet.image

        return cell
    }
}

