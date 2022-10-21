//
//  DefaultCRTestViewController.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/21.
//

import UIKit
import SnapKit

class DefaultCRViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [
            createDataButton,
            readDataButton
        ].forEach({
            view.addSubview($0)
            $0.backgroundColor = . yellow
            $0.setTitleColor(.black, for: .normal)
        })
        
        setUpLayout()
        componentConfigure()
    }
    
    func setUpLayout() {
        createDataButton.snp.makeConstraints({
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        })
        
        readDataButton.snp.makeConstraints({
            $0.top.equalTo(createDataButton).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        })
    }
    
    func componentConfigure() {
        createDataButton.addTarget(self, action: #selector(createData), for: .touchUpInside)
        readDataButton.addTarget(self, action: #selector(readData), for: .touchUpInside)
    }

    @objc func createData() {
        let info = VideoInfo(gymName: "Zinzinzara", gymVisitDate: Date(), videoUrl: "Something...", problemLevel: 3, isSucceeded: false)
        CoreDataManager.shared.createData(info: info)
    }
    
    @objc func readData() {
        let infoList = CoreDataManager.shared.readData()
        
        printCurrentLeftObject()
    }
}

extension DefaultCRViewController {
    func printCurrentLeftObject() {
        CoreDataManager.shared.readData().forEach({
            print("Data \($0.gymName) \($0.gymVisitDate) \($0.problemLevel) \($0.isSucceeded)")
        })
    }
}

