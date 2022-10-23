//
//  DataRepository.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/24.
//

import Foundation
import CoreData

class DataRepository {
    
    var rawVideoInformation: [VideoInformation] = []
    var sortedVideoInformation: [[VideoInformation]] = []
    
    init() { }
    
    func filterVideoInformation(filterOption: FilterOption) -> [VideoInformation] {
        
        switch filterOption {
        case .all:
            return rawVideoInformation
        case .favorite:
            return rawVideoInformation.filter({ $0.isFavorite == true })
        case .success:
            return rawVideoInformation.filter({ $0.isSucceeded == true})
        case .failure:
            return rawVideoInformation.filter({ $0.isSucceeded == false })
        }
    }
    
    func sortVideoInformation(filterOption: FilterOption, sortOption: SortOption) {
        
        self.sortedVideoInformation.removeAll()
        
        var filteredInformation = filterVideoInformation(filterOption: filterOption)
        
        if filteredInformation.count == 0 {
            print("해당하는 기준 조건의 영상이 존재하지 않습니다")
            return
        }
        var sortedInformation: [[VideoInformation]] = []
        
        var filteredInfoIndex = 0
        var currentSortedInformationIndex = 0
        
        switch sortOption {
            
            // MARK: 클라이밍장 이름을 분류하는 케이스
            /* sort함수를 통해 클라이밍장 이름으로 먼저 분류합니다.
             오름차순 이름으로 정렬된 filteredInformation이 만약 내림차순으로 구현되어야한다면 해당 배열을 reverse합니다.
             여기까지 작업이 완료되었다면 1차원 배열인 filteredInformation을 클라이밍장 이름별로 2차원 배열로 만들어줍니다.
             같은 이름 하위에 다양한 날짜가 존재하므로 이를 오름차순으로 정렬하기 위해 1차원 배열 visitDateSortedArray를 만들어줍니다.
             여기까지 작업이 완료되었다면 1차원 배열인 visitDateSortedArray를 클라이밍장 이름, 날짜가 동일한 것들을 묶어 2차원 배열 finalSortedInformation로 만들어줍니다.
             */
        case .gymName:
            
            filteredInformation.sort(by: { $0.gymName < $1.gymName })
            
            sortedInformation.append([])
            var currentGymName = filteredInformation[filteredInfoIndex].gymName
            
            while filteredInfoIndex != filteredInformation.count {
                
                if filteredInformation[filteredInfoIndex].gymName == currentGymName {
                    sortedInformation[currentSortedInformationIndex].append(filteredInformation[filteredInfoIndex])
                } else {
                    sortedInformation.append([])
                    currentSortedInformationIndex += 1
                    sortedInformation[currentSortedInformationIndex].append(filteredInformation[filteredInfoIndex])
                    currentGymName = filteredInformation[filteredInfoIndex].gymName
                }
                
                filteredInfoIndex += 1
                
            }
            
            for index in 0..<sortedInformation.count {
                sortedInformation[index].sort(by: {$0.gymVisitDate > $1.gymVisitDate})
            }
            
            self.sortedVideoInformation = sortedInformation
            
            // MARK: 클라이밍장 이름을 분류하는 케이스
            /* sort함수를 통해 클라이밍장 방문 날짜로 먼저 분류합니다.
             오름차순 이름으로 정렬된 filteredInformation이 만약 내림차순으로 구현되어야한다면 해당 배열을 reverse합니다.
             여기까지 작업이 완료되었다면 1차원 배열인 filteredInformation을 클라이밍장 방문 날짜별로 2차원 배열로 만들어줍니다.
             같은 날짜 하위에 다양한 날짜가 존재할 가능성이 있으므로 이를 내림차순으로 정렬하기 위해 1차원 배열 visitDateSortedArray를 만들어줍니다.
             여기까지 작업이 완료되었다면 1차원 배열인 gymNameSortedArray를 클라이밍장 이름, 날짜가 동일한 것들을 묶어 2차원 배열 finalSortedInformation로 만들어줍니다.
             */
        case .gymVisitDate:
            
            filteredInformation.sort(by: { $0.gymVisitDate < $1.gymVisitDate })
            
            sortedInformation.append([])
            var currentGymVisitDate = filteredInformation[filteredInfoIndex].gymVisitDate.formatted(date: .numeric, time: .omitted)
            
            while filteredInfoIndex != filteredInformation.count {
                
                if filteredInformation[filteredInfoIndex].gymVisitDate.formatted(date: .numeric, time: .omitted) == currentGymVisitDate {
                    sortedInformation[currentSortedInformationIndex].append(filteredInformation[filteredInfoIndex])
                } else {
                    sortedInformation.append([])
                    currentSortedInformationIndex += 1
                    sortedInformation[currentSortedInformationIndex].append(filteredInformation[filteredInfoIndex])
                    currentGymVisitDate = filteredInformation[filteredInfoIndex].gymVisitDate.formatted(date: .numeric, time: .omitted)
                }
                
                filteredInfoIndex += 1
                
            }
            
            currentSortedInformationIndex = -1
            
            var finalSortedInformation: [[VideoInformation]] = []
            
            for index in 0..<sortedInformation.count {
                
                if sortedInformation[index].count == 0 {
                    print("-----")
                    continue
                }
                
                let gymNameSortedArray = sortedInformation[index].sorted(by: { $0.gymName < $1.gymName })
                
                filteredInfoIndex = 0
                
                var currentGymName = gymNameSortedArray[filteredInfoIndex].gymName
                
                finalSortedInformation.append([])
                currentSortedInformationIndex += 1
                
                while filteredInfoIndex != gymNameSortedArray.count {
                    
                    if gymNameSortedArray[filteredInfoIndex].gymName == currentGymName {
                        finalSortedInformation[currentSortedInformationIndex].append(gymNameSortedArray[filteredInfoIndex])
                        printData(info: gymNameSortedArray[filteredInfoIndex], primarySortOption: .gymVisitDate)
                    } else {
                        finalSortedInformation.append([])
                        currentSortedInformationIndex += 1
                        finalSortedInformation[currentSortedInformationIndex].append(gymNameSortedArray[filteredInfoIndex])
                        currentGymName = gymNameSortedArray[filteredInfoIndex].gymName
                        printData(info: gymNameSortedArray[filteredInfoIndex], primarySortOption: .gymVisitDate)
                        print("-----")
                    }
                    
                    filteredInfoIndex += 1
                    
                }
            }
            
            self.sortedVideoInformation = finalSortedInformation
        }
    }
    
    // 현재 정렬된 VideoInformation 2차원 배열을 reverse
    func reverseSort() {
        sortedVideoInformation.reverse()
    }

    func finalSortVideoInformation(filterOption: FilterOption, sortOption: SortOption, orderOption: OrderOption) {
        sortVideoInformation(filterOption: filterOption, sortOption: sortOption)
        
        if orderOption == .descend {
            reverseSort()
        }
    }
    
    func createData(info: VideoInfo) {
        
        let entity = VideoInformation()
        
        entity.gymName = info.gymName
        entity.gymVisitDate = info.gymVisitDate
        entity.videoUrl = info.videoUrl
        entity.problemLevel = Int16(info.problemLevel)
        entity.isSucceeded = info.isSucceeded
        
        rawVideoInformation.append(entity)
    }
    
    // MARK: EditCase TWO 1 - 코드 반복 O
    func updateDateAndGymData(videoInformation: VideoInformation, gymVisitDate: Date, gymName: String) {

        guard let id = videoInformation.id else { return }
        
        let target = rawVideoInformation.filter({ $0.id == id })
        target[0].gymVisitDate = gymVisitDate
        target[0].gymName = gymName
    }
    
    // MARK: EditCase TWO 2 - 코드 반복 O
    func updateLevelAndPF(videoInformation: VideoInformation, problemLevel: Int, isSucceeded: Bool) {

        guard let id = videoInformation.id else { return }
        
        let target = rawVideoInformation.filter({ $0.id == id })
        target[0].problemLevel = Int16(problemLevel)
        target[0].isSucceeded = isSucceeded
    }
    
    func updateFavorite(videoInformation: VideoInformation, isFavorite: Bool) {
        
        guard let id = videoInformation.id else { return }
        
        let target = rawVideoInformation.filter({ $0.id == id })
        target[0].isFavorite = isFavorite
    }
    
    func updateFeedback(videoInformation: VideoInformation, feedback: String) {

        guard let id = videoInformation.id else { return }
        
        let target = rawVideoInformation.filter({ $0.id == id })
        target[0].feedback = feedback
    }
    
    func deleteData(videoInformation: VideoInformation) {
//
//        guard let id = videoInformation.id else { print("NONE EXIST...")
//            return }
//
        
        let target = rawVideoInformation.filter({ $0 == videoInformation })
        print("CONFIRM")
        if let index = rawVideoInformation.firstIndex(of: target[0]) {
            rawVideoInformation.remove(at: index)
        }
        print("Delete Data")
    }
    
    func deleteAllData() {
        
        sortedVideoInformation.removeAll()
        rawVideoInformation.removeAll()
    }
    
    func printRawData(standard: SortOption) {
        print(rawVideoInformation.count)
        print("-----RAW-----")
        for info in rawVideoInformation {
            printData(info: info, primarySortOption: standard)
        }
        print("------------")
        print("================================")
    }
    func printAllSortedData(standard: SortOption) {
        print("------SORTED------")
        for i in 0..<sortedVideoInformation.count {
            for j in 0..<sortedVideoInformation[i].count {
                printData(info: sortedVideoInformation[i][j], primarySortOption: standard)
            }
            
            print("---NEXT ARRAY---")
        }
        print("------------------")
        print("================================")
    }
    
    func printData(info: VideoInformation, primarySortOption: SortOption) {
        
        if primarySortOption == .gymName {
            print("\(info.gymName) | \(info.gymVisitDate.formatted(date: .numeric, time: .omitted)) | \(info.videoUrl) | \(info.problemLevel) | 즐겨찾기 \(info.isFavorite) | 성공 \(info.isSucceeded)")
        } else {
            print("| \(info.gymVisitDate.formatted(date: .numeric, time: .omitted)) | \(info.gymName) | \(info.videoUrl) | \(info.problemLevel) | 즐겨찾기 \(info.isFavorite) | 성공 \(info.isSucceeded)")
        }
    }
    
    func printDataList(info: [VideoInformation], primarySortOption: SortOption) {
        for information in rawVideoInformation {
            printData(info: information,primarySortOption: primarySortOption)
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
