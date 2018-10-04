//
//  ArticleViewCell.swift
//  APIPracticing
//
//  Created by ＫＫＤＳ on 2018/10/3.
//  Copyright © 2018年 KKDS. All rights reserved.
//

import UIKit

class ArticleViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var article:Article? {
        didSet {
            articleTitle.text = article?.title
            articleDescription.text = article?.description
        }
    }
    
    
    
    let articleTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    let articleDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    
    func setupView() {
        addSubview(articleTitle)
        articleTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        articleTitle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true

        addSubview(articleDescription)
        articleDescription.topAnchor.constraint(equalTo: articleTitle.bottomAnchor).isActive = true
        articleDescription.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleDescription.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleDescription.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
    }
    
}
