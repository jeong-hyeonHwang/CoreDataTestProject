//
//  DefaultCRUDTestViewController.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/19.
//

import UIKit
import SnapKit

class DefaultCRUDTestViewController: UIViewController {

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
    
    lazy var updateGymDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE GYM", for: .normal)
        return button
    }()
    
    lazy var updateProblemDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE PROB", for: .normal)
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
            updateGymDataButton,
            updateProblemDataButton,
            deleteDataButton,
            deleteAllDataButton
        ].forEach({
            view.addSubview($0)
            $0.backgroundColor = . yellow
            $0.setTitleColor(.black, for: .normal)
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
        
        updateGymDataButton.snp.makeConstraints({
            $0.top.equalTo(readDataButton).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        updateProblemDataButton.snp.makeConstraints({
            $0.top.equalTo(updateGymDataButton).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        deleteDataButton.snp.makeConstraints({
            $0.top.equalTo(updateProblemDataButton).inset(100)
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
        updateGymDataButton.addTarget(self, action: #selector(updateGymData), for: .touchUpInside)
        updateProblemDataButton.addTarget(self, action: #selector(updateProblemData), for: .touchUpInside)
        deleteDataButton.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
        deleteAllDataButton.addTarget(self, action: #selector(deleteAllData), for: .touchUpInside)
    }

    @objc func createData() {
        let info = VideoInfo(gymName: "Zinzinzara", gymVisitDate: Date(), videoUrl: "Something...", problemLevel: 3, isSucceeded: false)
        CoreDataManager.shared.createData(info: info)
    }
    
    @objc func readData() {
        let infoList = CoreDataManager.shared.readData()
        
//        if infoList.count != 0 {
//            print("Current Gym Name ", infoList[0].gymName)
//        }
//        print("Current Data Num Is ", infoList.count)
        
        printCurrentLeftObject()
    }
    
//    @objc func updateData() {
//        let infoList = CoreDataManager.shared.readData()
//        CoreDataManager.shared.updateData(videoInformation: infoList[0], value: "어디가니", editAttribute: EditAttribute.gymName)
//
//        printCurrentLeftObject()
//    }
    
    @objc func updateGymData() {
        let infoList = CoreDataManager.shared.readData()
        CoreDataManager.shared.updateDateAndGymData(videoInformation: infoList[0], gymVisitDate: Date(), gymName: "어디가니")
        
        printRevisedObjectGymInfo()
    }
    
    @objc func updateProblemData() {
        let infoList = CoreDataManager.shared.readData()
        CoreDataManager.shared.updateLevelAndPF(videoInformation: infoList[0], problemLevel: 5, isSucceeded: true)
        
        printRevisedObjectProblemInfo()
    }
    
    @objc func deleteData() {
        let infoList = CoreDataManager.shared.readData()
        CoreDataManager.shared.deleteData(videoInformation: infoList[0])
        
        printCurrentLeftObject()
    }
    
    @objc func deleteAllData() {
        CoreDataManager.shared.deleteAllData()
    }
}

extension DefaultCRUDTestViewController {
    func printCurrentLeftObject() {
        CoreDataManager.shared.readData().forEach({
            print("Data \($0.gymName) \($0.gymVisitDate) \($0.problemLevel) \($0.isSucceeded)")
        })
    }
    
    func printRevisedObjectGymInfo() {
        let data = CoreDataManager.shared.readData()[0]
        print("Gym Info " , data.gymName, " ", data.gymVisitDate)
    }
    
    func printRevisedObjectProblemInfo() {
        let data = CoreDataManager.shared.readData()[0]
        print("Problem Info " , data.problemLevel, " ", data.isSucceeded)
    }
}
