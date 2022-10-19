//
//  ViewController.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/19.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var createDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("CREATE", for: .normal)
        return button
    }()
    
    lazy var readDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("READ", for: .normal)
        return button
    }()
    
    lazy var updateDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE", for: .normal)
        return button
    }()
    
    lazy var deleteDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE", for: .normal)
        return button
    }()
    
    lazy var deleteAllDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [
            createDataButton,
            readDataButton,
            updateDataButton,
            deleteDataButton,
            deleteAllDataButton
        ].forEach({
            view.addSubview($0)
        })
    }


}

