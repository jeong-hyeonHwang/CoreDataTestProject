//
//  DataManager.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/24.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    var repository = DataRepository()
    var coreDataManager = CoreDataManager()
    
    var currentFilterOption: FilterOption = .all
    var currentSortOption: SortOption = .gymVisitDate
    var currentOrderOption: OrderOption = .ascend
    
    init() {
        
//        coreDataManager.deleteAllData()
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
        //repository.createData(info: info)
        coreDataManager.createData(info: info)
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
