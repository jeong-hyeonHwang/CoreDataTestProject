//
//  CoreDataManager.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/19.
//

import UIKit
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var context = appDelegate.persistentContainer.viewContext
    
    init() {
        do {
            try context.fetch(VideoInformation.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // struct class 어느게 swift에서 효율이 좋을까
    func createData(info: VideoInfo) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "VideoInformation", into: context)
        
        entity.setValue(UUID(), forKey: "id")
        entity.setValue(info.gymName, forKey: "gymName")
        entity.setValue(info.gymVisitDate, forKey: "gymVisitDate")
        entity.setValue(info.videoUrl, forKey: "videoUrl")
        entity.setValue(info.problemLevel, forKey: "problemLevel")
        entity.setValue(info.isSucceeded, forKey: "isSucceeded")
        
        saveData(context: context)
    }
    
    func readData() -> [VideoInformation] {
        var information: [VideoInformation] = []
        
        do {
            information = try context.fetch(VideoInformation.fetchRequest())
            if information.count > 0 {
//                print("CURRENT Gym Name Is \(information[0].gymName)")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return information
    }
    
    // MARK: Ver.Update with Index
    func updateData(index: Int) {
        let information = readData()
        
        if information.count > index {
            information[index].setValue("NOWhere", forKey: "gymName")
            print("Update Data Index is \(index)")
            saveData(context: context)
        } else {
         print("FAILURE: \(index)th index doesn't Exist")
        }
    }
    
    func updateData(videoInformation: VideoInformation) {

        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                    do {
                        let info = try context.fetch(request)
                            if let tempInfo = info.first {
                                tempInfo.setValue("GIIIE", forKey: "gymName")
                            }
                        } catch {
                        print("업데이트 실패")
                    }
            saveData(context: context)
    }
    
    // MARK: EditCase One 1 - 코드 반복 O
    func updateData(videoInformation: VideoInformation, value: Any, editAttribute: EditAttribute) {

        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                    do {
                        let info = try context.fetch(request)
                            if let tempInfo = info.first {
                                tempInfo.setValue(value, forKey: editAttribute.rawValue)
                            }
                        } catch {
                        print("업데이트 실패")
                    }
            saveData(context: context)
    }
    
    // MARK: EditCase TWO 1 - 코드 반복 O
    func updateDateAndGymData(videoInformation: VideoInformation, gymVisitDate: Date, gymName: String) {

        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                    do {
                        let info = try context.fetch(request)
                            if let tempInfo = info.first {
                                tempInfo.setValue(gymVisitDate, forKey: "gymVisitDate")
                                tempInfo.setValue(gymName, forKey: "gymName")
                            }
                        } catch {
                        print("업데이트 실패")
                    }
            saveData(context: context)
    }
    
    // MARK: EditCase TWO 2 - 코드 반복 O
    func updateLevelAndPF(videoInformation: VideoInformation, problemLevel: Int, isSucceeded: Bool) {

        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                    do {
                        let info = try context.fetch(request)
                            if let tempInfo = info.first {
                                tempInfo.setValue(problemLevel, forKey: "problemLevel")
                                tempInfo.setValue(isSucceeded, forKey: "isSucceeded")
                            }
                        } catch {
                        print("업데이트 실패")
                    }
            saveData(context: context)
    }
    
    func updateFeedback(videoInformation: VideoInformation, feedback: String) {

        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                    do {
                        let info = try context.fetch(request)
                            if let tempInfo = info.first {
                                tempInfo.setValue(feedback, forKey: "feedback")
                            }
                        } catch {
                        print("업데이트 실패")
                    }
            saveData(context: context)
    }
    
    // MARK: Ver.Delete with Index
    func deleteData(index: Int) {
        let information = readData()
        
        if information.count > index {
            context.delete(information[index])
            print("Delete Data Index is \(index)")
            saveData(context: context)
        } else {
            print("FAILURE: \(index)th index doesn't Exist")
        }
    }
    
    func deleteData(videoInformation: VideoInformation) {
        
        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            let info = try context.fetch(request)
                if let tempInfo = info.first {
                    context.delete(tempInfo)
                }
            } catch {
            print("업데이트 실패")
        }
        saveData(context: context)
    }
    
    func deleteAllData() {
        let objects = readData()
        
        if objects.count > 0 {
            for object in objects {
                context.delete(object)
            }
            print("DELETE ALL DATA")
            saveData(context: context)
        } else {
            print("FAILURE: Index doesn't Exist")
        }
    }
    
    func saveData(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
//    func filterData(isPlace: Bool) -> [VideoInformation] {
//        let items = readData()
//
//        let filterdItems = items.filter
//
//        return filteredItems
//    }
//
//    // ---
//    // Favorite, PF
//    func secondFilterData(whichOne: Enum) -> [VideoInformation] {
//
//        let filterData
//        switch
//
//        return filterData(isPlace: <#T##Bool#>)
//    }
//
//    // Count
//    func count() -> Int {
//        return secondFilterData().count
//    }
    
}

