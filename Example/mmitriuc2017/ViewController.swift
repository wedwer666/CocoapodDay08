//
//  ViewController.swift
//  mmitriuc2017
//
//  Created by wedwer666 on 04/28/2017.
//  Copyright (c) 2017 wedwer666. All rights reserved.
//

import UIKit
import mmitriuc2017


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = ArticleManager.init()
        let article = manager.newArticle("New", "N", nil, nil, nil, nil)
        article.creation_date = NSDate()
        article.title = "M"
        // Do any additional setup after loading the view, typically from a nib.
        manager.save()
        print(manager.getAllArticles())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

