//
//  UpdateDeleteViewController.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/24.
//

import UIKit

//class UpdateDeleteViewController: UIViewController {
//
//    let nameList = ["1암장", "2암장", "3암장", "4암장", "5암장"]
//    let dateList = [1, 2, 3, 4, 5]
//    let url = "URL"
//    let probLevelList = [0, 1, 2, 3, 4, 5]
//    let tf = [true, false]
//    
//    let fontSize: CGFloat = 10
//    let margin: CGFloat = 10
//    let widthNHeight: CGFloat = 75
//    
//    let sortButtonText = ["GYM UP", "GYM DOWN", "DATE UP", "DATE DOWN"]
//    let sortButtons: [UIButton] = [UIButton(), UIButton(), UIButton(), UIButton()]
//    
//    let sortNFilterButtonText = ["GYM\nUP\nFAV", "GYM\nDOWN\nFAV", "DATE\nUP\nFAV", "DATE\nDOWN\nFAV", "GYM\nUP\nPASS", "GYM\nDOWN\nPASS", "DATE\nUP\nPASS", "DATE\nDOWN\nPASS", "GYM\nUP\nFAIL", "GYM\nDOWN\nFAIL", "DATE\nUP\nFAIL", "DATE\nDOWN\nFAIL"]
//    let sortNFilterButtons: [UIButton] = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        coreDataRandomvideoInformationGenerate(howMany: 30)
//        
//        layoutConfigureForSortNFilterButtons()
//        updateNDeleteButtonComponentConfigure()
//    }
//    
//    func layoutConfigureForSortButtons() {
//        
//        let safeArea = view.safeAreaLayoutGuide
//        
//        for index in 0..<sortButtons.count {
//            view.addSubview(sortButtons[index])
//            sortButtons[index].backgroundColor = . yellow
//            sortButtons[index].titleLabel?.font = .systemFont(ofSize: fontSize)
//            sortButtons[index].setTitle(sortButtonText[index], for: .normal)
//            sortButtons[index].setTitleColor(.black, for: .normal)
//            
//            if index != 0 {
//                sortButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(sortButtons[index-1].snp.bottom).offset(margin)
//                    $0.centerX.equalToSuperview()
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            } else {
//                sortButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(safeArea).offset(margin)
//                    $0.centerX.equalToSuperview()
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            }
//        }
//    }
//                                               
////    func sortButtonComponentConfigure() {
////        sortButtons[0].addTarget(self, action: #selector(gymUPSort), for: .touchUpInside)
////        sortButtons[1].addTarget(self, action: #selector(gymDOWNSort), for: .touchUpInside)
////        sortButtons[2].addTarget(self, action: #selector(dateUPSort), for: .touchUpInside)
////        sortButtons[3].addTarget(self, action: #selector(dateDOWNSort), for: .touchUpInside)
////    }
//    
//    
//    func layoutConfigureForSortNFilterButtons() {
//        
//        let safeArea = view.safeAreaLayoutGuide
//        
//        for index in 0..<sortNFilterButtons.count {
//            view.addSubview(sortNFilterButtons[index])
//            sortNFilterButtons[index].backgroundColor = . yellow
//            sortNFilterButtons[index].titleLabel?.font = .systemFont(ofSize: fontSize)
//            sortNFilterButtons[index].setTitle(sortNFilterButtonText[index], for: .normal)
//            sortNFilterButtons[index].setTitleColor(.black, for: .normal)
//            sortNFilterButtons[index].titleLabel?.numberOfLines = 3
//            
//            if index == 0 {
//                sortNFilterButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(safeArea.snp.top).offset(margin)
//                    $0.leading.equalTo(safeArea.snp.leading).inset(margin)
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            }
//            else if index < 4 {
//                sortNFilterButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(sortNFilterButtons[index-1].snp.bottom).offset(margin)
//                    $0.leading.equalTo(safeArea.snp.leading).inset(margin)
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            } else if index == 4 {
//                sortNFilterButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(safeArea.snp.top).offset(margin)
//                    $0.centerX.equalToSuperview()
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            } else if index < 8 {
//                sortNFilterButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(sortNFilterButtons[index-1].snp.bottom).offset(margin)
//                    $0.centerX.equalToSuperview()
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            } else if index == 8 {
//                sortNFilterButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(safeArea.snp.top).offset(margin)
//                    $0.trailing.equalTo(safeArea.snp.trailing).inset(margin)
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            } else {
//                sortNFilterButtons[index].snp.makeConstraints({
//                    $0.top.equalTo(sortNFilterButtons[index-1].snp.bottom).offset(margin)
//                    $0.trailing.equalTo(safeArea.snp.trailing).inset(margin)
//                    $0.width.height.equalTo(widthNHeight)
//                })
//            }
//        }
//    }
//    
//    func sortNFilterButtonComponentConfigure() {
//        sortNFilterButtons[0].addTarget(self, action: #selector(gymUPFavSort), for: .touchUpInside)
//        sortNFilterButtons[1].addTarget(self, action: #selector(gymDOWNFavSort), for: .touchUpInside)
//        sortNFilterButtons[2].addTarget(self, action: #selector(dateUPFavSort), for: .touchUpInside)
//        sortNFilterButtons[3].addTarget(self, action: #selector(dateDOWNFavSort), for: .touchUpInside)
//        sortNFilterButtons[4].addTarget(self, action: #selector(gymUPSuccessSort), for: .touchUpInside)
//        sortNFilterButtons[5].addTarget(self, action: #selector(gymDOWNSuccessSort), for: .touchUpInside)
//        sortNFilterButtons[6].addTarget(self, action: #selector(dateUPSuccessSort), for: .touchUpInside)
//        sortNFilterButtons[7].addTarget(self, action: #selector(dateDOWNSuccessSort), for: .touchUpInside)
//        sortNFilterButtons[8].addTarget(self, action: #selector(gymUPFailureSort), for: .touchUpInside)
//        sortNFilterButtons[9].addTarget(self, action: #selector(gymDOWNFailureSort), for: .touchUpInside)
//        sortNFilterButtons[10].addTarget(self, action: #selector(dateUPFailureSort), for: .touchUpInside)
//        sortNFilterButtons[11].addTarget(self, action: #selector(dateDOWNFailureSort), for: .touchUpInside)
//
//    }
//    
//    // MARK: NORMAL SORT ONLY
//    @objc func gymUPSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymName)
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//    }
//
//    @objc func gymDOWNSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymName)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//
//    }
//
//    @objc func dateUPSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymVisitDate)
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    @objc func dateDOWNSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymVisitDate)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    // MARK: FILTER N SORT
//    @objc func gymUPFavSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymName)
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//    }
//
//    @objc func gymDOWNFavSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymName)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//    }
//
//    @objc func dateUPFavSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymVisitDate)
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    @objc func dateDOWNFavSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymVisitDate)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    @objc func gymUPSuccessSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymName)
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//
//    }
//
//    @objc func gymDOWNSuccessSort () {
//       // DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymName)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//    }
//
//    @objc func dateUPSuccessSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymVisitDate)
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    @objc func dateDOWNSuccessSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymVisitDate)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    @objc func gymUPFailureSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymName)
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//    }
//
//    @objc func gymDOWNFailureSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymName)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymName)
//    }
//
//    @objc func dateUPFailureSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymVisitDate)
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//
//    @objc func dateDOWNFailureSort () {
//        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymVisitDate)
//        DataManager.shared.repository.reverseSort()
//        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
//    }
//    
//    func randomvideoInformationGenerate(howMany: Int) -> [VideoInfoForDummy] {
//        
//        var dataList: [VideoInfoForDummy] = []
//        
//        for _ in 0..<howMany {
//            let randomIndex = Int.random(in: 0..<nameList.count)
//            let name = nameList[randomIndex]
//            let date = dateList[Int.random(in: 0..<nameList.count)]
//            let url = url
//            let level = probLevelList[Int.random(in: 0..<probLevelList.count)]
//            let isSucceeded = tf[Int.random(in: 0..<tf.count)]
//            let isFavorite = tf[Int.random(in: 0..<tf.count)]
//            
//            let info = VideoInfoForDummy(gymName: name, gymVisitDate: date, videoUrl: url, problemLevel: level, isSucceeded: isSucceeded, isFavorite: isFavorite)
//            
//            dataList.append(info)
//        }
//        
//        return dataList
//    }
//    
//    func coreDataRandomvideoInformationGenerate(howMany: Int) {
//        
////        DataManager.shared.deleteAllData()
//        
//        for _ in 0..<howMany {
//            let randomIndex = Int.random(in: 0..<nameList.count)
//            let name = nameList[randomIndex]
//            let date = Date.random(in: Date(timeIntervalSince1970: 0)..<Date(timeIntervalSince1970: 2000000))
//            let url = url
//            let level = probLevelList[Int.random(in: 0..<probLevelList.count)]
//            let isSucceeded = tf[Int.random(in: 0..<tf.count)]
//            let isFavorite = tf[Int.random(in: 0..<tf.count)]
//            
//            let info = VideoInfo(gymName: name, gymVisitDate: date, videoUrl: url, problemLevel: level, isSucceeded: isSucceeded)
//            
//            DataManager.shared.createData(info: info)
//            
//        }
//        
////        print(DataManager.shared.coreDataManager.readData().count)
//    }
//
//
//}
