//
//  DataManager.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/24.
//

import Foundation

class DataManager {
    
    let nameList = ["1암장", "2암장", "3암장", "4암장", "5암장"]
    let dateList = [1, 2, 3, 4, 5]
    let url = "URL"
    let probLevelList = [0, 1, 2, 3, 4, 5]
    let tf = [true, false]
    
    static var shared = DataManager()
    
    var repository: DataRepository!
    var coreDataManager: CoreDataManager!
    
    var currentFilterOption: FilterOption = .all
    var currentSortOption: SortOption = .gymVisitDate
    var currentOrderOption: OrderOption = .ascend
    
    init() {
        
        repository = DataRepository()
        coreDataManager = CoreDataManager()
        
    }
    
    func repositoryUpdate() {
        repository.rawVideoInformation = coreDataManager.readData()
        repository.finalSortVideoInformation(filterOption: currentFilterOption, sortOption: currentSortOption, orderOption: currentOrderOption)
    }
    
    func changeSortOption(sortOption: SortOption) {
        currentSortOption = sortOption
    }
    
    func changeFilterOption(filterOption: FilterOption) {
        currentFilterOption = filterOption
    }
    
    func changeOrderOption(orderOption: OrderOption) {
        currentOrderOption = orderOption
    }
    
    
    func createData(info: VideoInfo) {
        coreDataManager.createData(info: info)
//        repository.createData(info: info)
    }
    
    func updateDateAndGymData(videoInformation: VideoInformation, gymVisitDate: Date, gymName: String) {
        coreDataManager.updateDateAndGymData(videoInformation: videoInformation, gymVisitDate: gymVisitDate, gymName: gymName)
        repository.updateDateAndGymData(videoInformation: videoInformation, gymVisitDate: gymVisitDate, gymName: gymName)
    }
    
    func updateLevelAndPF(videoInformation: VideoInformation, problemLevel: Int, isSucceeded: Bool) {
        coreDataManager.updateLevelAndPF(videoInformation: videoInformation, problemLevel: problemLevel, isSucceeded: isSucceeded)
        repository.updateLevelAndPF(videoInformation: videoInformation, problemLevel: problemLevel, isSucceeded: isSucceeded)
    }
    
    func updateFavorite(videoInformation: VideoInformation, isFavorite: Bool) {
        
        coreDataManager.updateFavorite(videoInformation: videoInformation, isFavorite: isFavorite)
        repository.updateFavorite(videoInformation: videoInformation, isFavorite: isFavorite)
    }
    
    func updateFeedback(videoInformation: VideoInformation, feedback: String) {
        coreDataManager.updateFeedback(videoInformation: videoInformation, feedback: feedback)
        repository.updateFeedback(videoInformation: videoInformation, feedback: feedback)
    }
    
    func deleteData(videoInformation: VideoInformation) {
        coreDataManager.deleteData(videoInformation: videoInformation)
        repository.deleteData(videoInformation: videoInformation)
    }
    
    func deleteAllData() {
        coreDataManager.deleteAllData()
        repository.deleteAllData()
    }
}

extension DataManager {
    func coreDataRandomvideoInformationGenerate(howMany: Int) {

        for _ in 0..<howMany {
            let randomIndex = Int.random(in: 0..<nameList.count)
            let name = nameList[randomIndex]
            let date = Date.random(in: Date(timeIntervalSince1970: 0)..<Date(timeIntervalSince1970: 2000000))
            let url = url
            let level = probLevelList[Int.random(in: 0..<probLevelList.count)]
            let isSucceeded = tf[Int.random(in: 0..<tf.count)]
            let isFavorite = tf[Int.random(in: 0..<tf.count)]
            
            let info = VideoInfo(gymName: name, gymVisitDate: date, videoUrl: url, problemLevel: level, isSucceeded: isSucceeded)
            
            createData(info: info)
            print("CREATE NEW DATA")
        }
        
        repositoryUpdate()
        
        print(coreDataManager.readData().count)
    }
}
