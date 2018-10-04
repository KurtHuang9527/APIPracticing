//
//  MainViewController.swift
//  APIPracticing
//
//  Created by ＫＫＤＳ on 2018/10/3.
//  Copyright © 2018年 KKDS. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    var articles:[Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "REST API"
        
        collectionView?.register(ArticleViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .white
        
        let urlString = "https://swift.mrgott.pro/blog.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                let articlesData = try JSONDecoder().decode([Article].self, from: data)
                
                DispatchQueue.main.async {
                    self.articles = articlesData
                    self.collectionView?.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
                
            }
            
            
            
        }.resume()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ArticleViewCell
        cell.article = articles?[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 100)
    }
    
    
}
