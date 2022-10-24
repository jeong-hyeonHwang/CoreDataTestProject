//
//  SortViewController.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/22.
//

import UIKit

class SortViewController: UIViewController {
    
//    var videoInformation: [VideoInformation] = []
    
    let fontSize: CGFloat = 10
    let margin: CGFloat = 10
    let widthNHeight: CGFloat = 75
    
    let sortButtonText = ["GYM UP", "GYM DOWN", "DATE UP", "DATE DOWN"]
    let sortButtons: [UIButton] = [UIButton(), UIButton(), UIButton(), UIButton()]
    
    let sortNFilterButtonText = ["GYM\nUP\nFAV", "GYM\nDOWN\nFAV", "DATE\nUP\nFAV", "DATE\nDOWN\nFAV", "GYM\nUP\nPASS", "GYM\nDOWN\nPASS", "DATE\nUP\nPASS", "DATE\nDOWN\nPASS", "GYM\nUP\nFAIL", "GYM\nDOWN\nFAIL", "DATE\nUP\nFAIL", "DATE\nDOWN\nFAIL"]
    let sortNFilterButtons: [UIButton] = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
    
    let updateButtonText = ["GYM\nNAME\nDATE\nUPDATE", "GYM\nLEVEL\nPF\nUPDATE", "GYM\nFEEDBACK\nUPDATE"]
    let deleteButtonText = ["Delete\nData", "Delete\nAll\nData"]
    
    let updateButtons: [UIButton] = [UIButton(), UIButton(), UIButton()]
    let deleteButtons: [UIButton] = [UIButton(), UIButton()]
    
    
    let rawDataShowButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutConfigureForSortButtons()
        sortButtonComponentConfigure()
        
        layoutConfigureForSortNFilterButtons()
        sortNFilterButtonComponentConfigure()
        
        layoutConfigureForUpdateNDeleteButtons()
        updateNDeleteComponentConfigure()
        
        rawDataButtonSet()
        
        // 새로운 데이터 생성 후 테스트 시 주석 제거 & repositoryUpdate 주석
//        DataManager.shared.deleteAllData()
//        DataManager.shared.coreDataRandomvideoInformationGenerate(howMany: 5)
        
        // 기존 데이터로 테스트 시 주석 제거 & line.46, 47 주석
        DataManager.shared.updateRepository()
        
    }
    
    func rawDataButtonSet() {
        
        view.addSubview(rawDataShowButton)
        rawDataShowButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(100)
            $0.width.height.equalTo(50)
        })
        
        rawDataShowButton.backgroundColor = .green
        rawDataShowButton.titleLabel?.font = .systemFont(ofSize: fontSize)
        rawDataShowButton.setTitle("RAW", for: .normal)
        rawDataShowButton.setTitleColor(.black, for: .normal)
        
        rawDataShowButton.addTarget(self, action: #selector(showAllData), for: .touchUpInside)
        
    }
    
    func layoutConfigureForSortButtons() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        for index in 0..<sortButtons.count {
            view.addSubview(sortButtons[index])
            sortButtons[index].backgroundColor = .red
            sortButtons[index].titleLabel?.font = .systemFont(ofSize: fontSize)
            sortButtons[index].setTitle(sortButtonText[index], for: .normal)
            sortButtons[index].setTitleColor(.black, for: .normal)
        }
        
        sortButtons[0].snp.makeConstraints({
            $0.leading.equalTo(safeArea).inset(margin)
            $0.centerY.equalToSuperview().offset(40)
            $0.width.height.equalTo(widthNHeight)
        })
        
        sortButtons[1].snp.makeConstraints({
            $0.leading.equalTo(safeArea).inset(margin * 10)
            $0.centerY.equalToSuperview().offset(40)
            $0.width.height.equalTo(widthNHeight)
        })
        
        sortButtons[2].snp.makeConstraints({
            $0.trailing.equalTo(safeArea).inset(margin * 10)
            $0.centerY.equalToSuperview().offset(40)
            $0.width.height.equalTo(widthNHeight)
        })
        
        sortButtons[3].snp.makeConstraints({
            $0.trailing.equalTo(safeArea).inset(margin)
            $0.centerY.equalToSuperview().offset(40)
            $0.width.height.equalTo(widthNHeight)
        })
    }
                                               
    func sortButtonComponentConfigure() {
        sortButtons[0].addTarget(self, action: #selector(gymUPSort), for: .touchUpInside)
        sortButtons[1].addTarget(self, action: #selector(gymDOWNSort), for: .touchUpInside)
        sortButtons[2].addTarget(self, action: #selector(dateUPSort), for: .touchUpInside)
        sortButtons[3].addTarget(self, action: #selector(dateDOWNSort), for: .touchUpInside)
    }
    
    
    func layoutConfigureForSortNFilterButtons() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        for index in 0..<sortNFilterButtons.count {
            view.addSubview(sortNFilterButtons[index])
            sortNFilterButtons[index].backgroundColor = . yellow
            sortNFilterButtons[index].titleLabel?.font = .systemFont(ofSize: fontSize)
            sortNFilterButtons[index].setTitle(sortNFilterButtonText[index], for: .normal)
            sortNFilterButtons[index].setTitleColor(.black, for: .normal)
            sortNFilterButtons[index].titleLabel?.numberOfLines = 3
            
            if index == 0 {
                sortNFilterButtons[index].snp.makeConstraints({
                    $0.top.equalTo(safeArea.snp.top).offset(margin)
                    $0.leading.equalTo(safeArea.snp.leading).inset(margin)
                    $0.width.height.equalTo(widthNHeight)
                })
            }
            else if index < 4 {
                sortNFilterButtons[index].snp.makeConstraints({
                    $0.top.equalTo(sortNFilterButtons[index-1].snp.bottom).offset(margin)
                    $0.leading.equalTo(safeArea.snp.leading).inset(margin)
                    $0.width.height.equalTo(widthNHeight)
                })
            } else if index == 4 {
                sortNFilterButtons[index].snp.makeConstraints({
                    $0.top.equalTo(safeArea.snp.top).offset(margin)
                    $0.centerX.equalToSuperview()
                    $0.width.height.equalTo(widthNHeight)
                })
            } else if index < 8 {
                sortNFilterButtons[index].snp.makeConstraints({
                    $0.top.equalTo(sortNFilterButtons[index-1].snp.bottom).offset(margin)
                    $0.centerX.equalToSuperview()
                    $0.width.height.equalTo(widthNHeight)
                })
            } else if index == 8 {
                sortNFilterButtons[index].snp.makeConstraints({
                    $0.top.equalTo(safeArea.snp.top).offset(margin)
                    $0.trailing.equalTo(safeArea.snp.trailing).inset(margin)
                    $0.width.height.equalTo(widthNHeight)
                })
            } else {
                sortNFilterButtons[index].snp.makeConstraints({
                    $0.top.equalTo(sortNFilterButtons[index-1].snp.bottom).offset(margin)
                    $0.trailing.equalTo(safeArea.snp.trailing).inset(margin)
                    $0.width.height.equalTo(widthNHeight)
                })
            }
        }
    }
    
    func sortNFilterButtonComponentConfigure() {
        sortNFilterButtons[0].addTarget(self, action: #selector(gymUPFavSort), for: .touchUpInside)
        sortNFilterButtons[1].addTarget(self, action: #selector(gymDOWNFavSort), for: .touchUpInside)
        sortNFilterButtons[2].addTarget(self, action: #selector(dateUPFavSort), for: .touchUpInside)
        sortNFilterButtons[3].addTarget(self, action: #selector(dateDOWNFavSort), for: .touchUpInside)
        sortNFilterButtons[4].addTarget(self, action: #selector(gymUPSuccessSort), for: .touchUpInside)
        sortNFilterButtons[5].addTarget(self, action: #selector(gymDOWNSuccessSort), for: .touchUpInside)
        sortNFilterButtons[6].addTarget(self, action: #selector(dateUPSuccessSort), for: .touchUpInside)
        sortNFilterButtons[7].addTarget(self, action: #selector(dateDOWNSuccessSort), for: .touchUpInside)
        sortNFilterButtons[8].addTarget(self, action: #selector(gymUPFailureSort), for: .touchUpInside)
        sortNFilterButtons[9].addTarget(self, action: #selector(gymDOWNFailureSort), for: .touchUpInside)
        sortNFilterButtons[10].addTarget(self, action: #selector(dateUPFailureSort), for: .touchUpInside)
        sortNFilterButtons[11].addTarget(self, action: #selector(dateDOWNFailureSort), for: .touchUpInside)

    }
    
    func layoutConfigureForUpdateNDeleteButtons() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        for index in 0..<deleteButtons.count {
            view.addSubview(deleteButtons[index])
            deleteButtons[index].backgroundColor = . blue
            deleteButtons[index].titleLabel?.font = .systemFont(ofSize: fontSize)
            deleteButtons[index].setTitle(deleteButtonText[index], for: .normal)
            deleteButtons[index].setTitleColor(.white, for: .normal)
            deleteButtons[index].titleLabel?.numberOfLines = 3
        }
        
        deleteButtons[0].snp.makeConstraints({
            $0.bottom.equalTo(safeArea.snp.bottom).inset(margin)
            $0.leading.equalTo(safeArea).inset(margin)
            $0.width.height.equalTo(widthNHeight)
        })
        
        deleteButtons[1].snp.makeConstraints({
            $0.bottom.equalTo(safeArea.snp.bottom).inset(margin)
            $0.trailing.equalTo(safeArea).inset(margin)
            $0.width.height.equalTo(widthNHeight)
        })
        
        
        for index  in 0..<updateButtons.count {
            view.addSubview(updateButtons[index])
            updateButtons[index].backgroundColor = . blue
            updateButtons[index].titleLabel?.font = .systemFont(ofSize: fontSize)
            updateButtons[index].setTitle(updateButtonText[index], for: .normal)
            updateButtons[index].setTitleColor(.white, for: .normal)
            updateButtons[index].titleLabel?.numberOfLines = 4
        }
        
        updateButtons[0].snp.makeConstraints({
            $0.bottom.equalTo(deleteButtons[0].snp.top).inset(-margin * 4)
            $0.leading.equalTo(safeArea).inset(margin)
            $0.width.height.equalTo(widthNHeight)
        })
        
        updateButtons[1].snp.makeConstraints({
            $0.bottom.equalTo(deleteButtons[0].snp.top).inset(-margin * 4)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(widthNHeight)
        })
        
        updateButtons[2].snp.makeConstraints({
            $0.bottom.equalTo(deleteButtons[0].snp.top).inset(-margin * 4)
            $0.trailing.equalTo(safeArea).inset(margin)
            $0.width.height.equalTo(widthNHeight)
        })
        
    }
    
    func updateNDeleteComponentConfigure() {
        deleteButtons[0].addTarget(self, action: #selector(deleteSingleInfo), for: .touchUpInside)
        deleteButtons[1].addTarget(self, action: #selector(deleteAllInfo), for: .touchUpInside)
        updateButtons[0].addTarget(self, action: #selector(updateGymNameNDate), for: .touchUpInside)
        updateButtons[1].addTarget(self, action: #selector(updateProbLevelNPF), for: .touchUpInside)
        updateButtons[2].addTarget(self, action: #selector(updateProbFeedback), for: .touchUpInside)
    }
    
    @objc func showAllData() {
        DataManager.shared.repository.printRawData(standard: .gymVisitDate)
    }
    
    // MARK: NORMAL SORT ONLY
    @objc func gymUPSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymName)
        DataManager.shared.repository.printAllSortedData(standard: .gymName)
    }

    @objc func gymDOWNSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymName)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymName)

    }

    @objc func dateUPSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymVisitDate)
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    @objc func dateDOWNSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .all, sortOption: .gymVisitDate)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    // MARK: FILTER N SORT
    @objc func gymUPFavSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymName)
        DataManager.shared.repository.printAllSortedData(standard: .gymName)
    }

    @objc func gymDOWNFavSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymName)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymName)
    }

    @objc func dateUPFavSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymVisitDate)
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    @objc func dateDOWNFavSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .favorite, sortOption: .gymVisitDate)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    @objc func gymUPSuccessSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymName)
        DataManager.shared.repository.printAllSortedData(standard: .gymName)

    }

    @objc func gymDOWNSuccessSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymName)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymName)
    }

    @objc func dateUPSuccessSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymVisitDate)
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    @objc func dateDOWNSuccessSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .success, sortOption: .gymVisitDate)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    @objc func gymUPFailureSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymName)
        DataManager.shared.repository.printAllSortedData(standard: .gymName)
    }

    @objc func gymDOWNFailureSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymName)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymName)
    }

    @objc func dateUPFailureSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymVisitDate)
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }

    @objc func dateDOWNFailureSort () {
        DataManager.shared.repository.sortVideoInformation(filterOption: .failure, sortOption: .gymVisitDate)
        DataManager.shared.repository.reverseSort()
        DataManager.shared.repository.printAllSortedData(standard: .gymVisitDate)
    }
    
    @objc func updateGymNameNDate() {
        let data = DataManager.shared.repository.rawVideoInformation[0]
        DataManager.shared.updateDateAndGymData(videoInformation: data, gymVisitDate: Date(), gymName: "SOMEWHERE")
    }
    
    @objc func updateProbLevelNPF() {
        let data = DataManager.shared.repository.rawVideoInformation[0]
        DataManager.shared.updateLevelAndPF(videoInformation: data, problemLevel: 45, isSucceeded: true)
    }
    
    @objc func updateProbFeedback() {
        let data = DataManager.shared.repository.rawVideoInformation[0]
        DataManager.shared.updateFeedback(videoInformation: data, feedback: "BLABHAHAHAAAA")
    }
    
    @objc func deleteSingleInfo() {
        let data = DataManager.shared.repository.rawVideoInformation[0]
        DataManager.shared.deleteData(videoInformation: data)
    }
    
    @objc func deleteAllInfo () {
        DataManager.shared.deleteAllData()
    }
    
}
