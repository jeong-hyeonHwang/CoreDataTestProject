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
    
    func createData(info: VideoInfo) {
        let entity = NSEntityDescription.entity(forEntityName: "VideoInformation", in: context)
        
        if let entity = entity {
            let videoInfo = NSManagedObject(entity: entity, insertInto: context)
            videoInfo.setValue(UUID(), forKey: "id")
            videoInfo.setValue(info.gymName, forKey: "gymName")
            videoInfo.setValue(info.gymVisitDate, forKey: "gymVisitDate")
            videoInfo.setValue(info.videoUrl, forKey: "videoUrl")
            videoInfo.setValue(info.problemLevel, forKey: "problemLevel")
            videoInfo.setValue(info.isSucceeded, forKey: "isSucceeded")
            videoInfo.setValue(info.feedback, forKey: "feedback")
            videoInfo.setValue(info.isFavorite, forKey: "isFavorite")
            
            saveData(context: context)
        }
    }
    
    func readData() -> [VideoInformation] {
        var information: [VideoInformation] = []
        
        do {
            information = try context.fetch(VideoInformation.fetchRequest())
            print("CURRENT Gym Name Is \(information[0].gymName)")
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
        
        for object in objects {
            context.delete(object)
        }
        
        saveData(context: context)
    }
    
    func saveData(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

