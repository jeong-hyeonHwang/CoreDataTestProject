//
//  CoreDataManager.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/19.
//

import UIKit
import CoreData

class CoreDataManager {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var context = appDelegate.persistentContainer.viewContext
    
    init() { }
    
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
        } catch {
            print(error.localizedDescription)
        }
        
        print("FETCH DATA ONLY ONCE")
        return information
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
    
    func updateFavorite(videoInformation: VideoInformation, isFavorite: Bool) {
        
        guard let id = videoInformation.id else { return }
        let request = VideoInformation.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                    do {
                        let info = try context.fetch(request)
                            if let tempInfo = info.first {
                                tempInfo.setValue(isFavorite, forKey: "isFavorite")
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
}

