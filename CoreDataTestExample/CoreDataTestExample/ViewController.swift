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
        button.setTitle("DELETE", for: .normal)
        return button
    }()
    
    lazy var deleteAllDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("⚠️DELETE ALL⚠️", for: .normal)
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
        
        layoutConfigure()
        componentConfigure()
    }
    
    func layoutConfigure() {
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
        
        updateDataButton.snp.makeConstraints({
            $0.top.equalTo(readDataButton).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        })
        
        deleteDataButton.snp.makeConstraints({
            $0.top.equalTo(updateDataButton).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        })
        
        deleteAllDataButton.snp.makeConstraints({
            $0.top.equalTo(deleteDataButton).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
    }
    
    func componentConfigure() {
        createDataButton.addTarget(self, action: #selector(createData), for: .touchUpInside)
        readDataButton.addTarget(self, action: #selector(readData), for: .touchUpInside)
        updateDataButton.addTarget(self, action: #selector(updateData), for: .touchUpInside)
        deleteDataButton.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
        deleteAllDataButton.addTarget(self, action: #selector(deleteAllData), for: .touchUpInside)
    }

    @objc func createData() {
        let info = VideoInfo(gymName: "Zinzinzara", gymVisitDate: Date(), videoUrl: "Something...", problemLevel: 3, isSucceeded: false)
        CoreDataManager.shared.createData(info: info)
    }
    
    @objc func readData() {
        let infoList = CoreDataManager.shared.readData()
        
        if infoList.count != 0 {
            print("Current Gym Name ", infoList[0].gymName)
        }
        print("Current Data Num Is ", infoList.count)
    }
    
    @objc func updateData() {
        CoreDataManager.shared.updateData(index: 0)
    }
    
    @objc func deleteData() {
        CoreDataManager.shared.deleteData(index: 0)
    }
    
    @objc func deleteAllData() {
        CoreDataManager.shared.deleteAllData()
        print("DELETE ALL DATA")
    }
}

