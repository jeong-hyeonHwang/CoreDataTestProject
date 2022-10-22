//
//  SortViewController+.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/22.
//

import Foundation

extension SortViewController {
    
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
    
    func randomDataGenerate() -> VideoInfoForDummy {
        
        let name = nameList[Int.random(in: 0..<nameList.count)]
        let date = dateList[Int.random(in: 0..<dateList.count)]
        let url = url
        let level = probLevelList[Int.random(in: 0..<probLevelList.count)]
        let isSucceeded = tf[Int.random(in: 0..<tf.count)]
        let isFavorite = tf[Int.random(in: 0..<tf.count)]
        
        let info = VideoInfoForDummy(gymName: name, gymVisitDate: date, videoUrl: url, problemLevel: level, isSucceeded: isSucceeded, isFavorite: isFavorite)
        
        return info
    }
    
    // List Type
    func randomDataListGenerate(howMany: Int) -> [VideoInfoForDummy] {
        
        var dataList: [VideoInfoForDummy] = []
        
        for _ in 0..<howMany {
            let randomIndex = Int.random(in: 0..<nameList.count)
            let name = nameList[randomIndex]
            let date = dateList[randomIndex]
            let url = String(Int.random(in: 0..<1000000))
            let level = probLevelList[Int.random(in: 0..<probLevelList.count)]
            let isSucceeded = tf[Int.random(in: 0..<tf.count)]
            let isFavorite = tf[Int.random(in: 0..<tf.count)]
            
            let info = VideoInfoForDummy(gymName: name, gymVisitDate: date, videoUrl: url, problemLevel: level, isSucceeded: isSucceeded, isFavorite: isFavorite)
            
            dataList.append(info)
        }
        
        return dataList
    }
    
    func filterVideoInformation(videoInformation: [VideoInfoForDummy], filterOption: FilterOption) -> [VideoInfoForDummy] {
        
        let originInformation = videoInformation
        var filteredInformation: [VideoInfoForDummy] = []
        switch filterOption {
        case .all:
            filteredInformation = originInformation
            break
        case .favorite:
            filteredInformation = originInformation.filter({ $0.isFavorite == true})
            break
        case .success:
            filteredInformation = originInformation.filter({ $0.isSucceeded == true})
            break
        case .failure:
            filteredInformation = originInformation.filter({ $0.isSucceeded == false })
            break
        }
        
        return filteredInformation
    }
    
    func sortVideoInformation(videoInformation: [VideoInfoForDummy], sortOption: SortOption, isAscend: Bool) -> [[VideoInfoForDummy]] {
        
        let originInformation = videoInformation
        
        var ascendedInformation : [VideoInfoForDummy] = []
        var sortedInformation: [[VideoInfoForDummy]] = []
        
        var currentCheckIndex = 0
        var currentSortedInformationIndex = 0
        
        switch sortOption {
        case .gymName:
            
            sortedInformation.append([])
            ascendedInformation = originInformation.sorted(by: { $0.gymName > $1.gymName })
            
            printDataNum(sortedVideoInformation: sortedInformation)
            
            if !isAscend {
                ascendedInformation.reverse()
            }
            
            var currentGymName = ascendedInformation[currentCheckIndex].gymName
            while currentCheckIndex != ascendedInformation.count {
                if ascendedInformation[currentCheckIndex].gymName == currentGymName {
                    sortedInformation[currentSortedInformationIndex].append(ascendedInformation[currentCheckIndex])
                } else {
                    sortedInformation.append([])
                    currentSortedInformationIndex += 1
                    sortedInformation[currentSortedInformationIndex].append(ascendedInformation[currentCheckIndex])
                    currentGymName = ascendedInformation[currentCheckIndex].gymName
                }
                currentCheckIndex += 1
            }

            printDataNum(sortedVideoInformation: sortedInformation)
            
            var secondSortedInformation: [[VideoInfoForDummy]] = []
            
            currentSortedInformationIndex = -1
            
            for index in 0..<sortedInformation.count {
                
                if sortedInformation[index].count == 0 {
                    continue
                }
                
                let temp1dArray = sortedInformation[index].sorted(by: { $0.gymVisitDate > $1.gymVisitDate })
                currentCheckIndex = 0
                var currentGymVisitDate = temp1dArray[currentCheckIndex].gymVisitDate
                
                secondSortedInformation.append([])
                currentSortedInformationIndex += 1
                while currentCheckIndex != temp1dArray.count {
                    
                    if temp1dArray[currentCheckIndex].gymVisitDate == currentGymVisitDate {
                        secondSortedInformation[currentSortedInformationIndex].append(temp1dArray[currentCheckIndex])
                    } else {
                        secondSortedInformation.append([])
                        currentSortedInformationIndex += 1
                        secondSortedInformation[currentSortedInformationIndex].append(temp1dArray[currentCheckIndex])
                        currentGymVisitDate = temp1dArray[currentCheckIndex].gymVisitDate
                    }
                    currentCheckIndex += 1
                }
            }
            printAllData(sortedVideoInformation: secondSortedInformation)
            return secondSortedInformation
            
        case .gymVisitDate:
            
            sortedInformation.append([])
            
            ascendedInformation = originInformation.sorted(by: { $0.gymVisitDate < $1.gymVisitDate })
            
            printDataNum(sortedVideoInformation: sortedInformation)
            
            var currentGymVisitDate = ascendedInformation[currentCheckIndex].gymVisitDate
            while currentCheckIndex != ascendedInformation.count {
                
                if ascendedInformation[currentCheckIndex].gymVisitDate == currentGymVisitDate {
                    sortedInformation[currentSortedInformationIndex].append(ascendedInformation[currentCheckIndex])
                } else {
                    sortedInformation.append([])
                    currentSortedInformationIndex += 1
                    sortedInformation[currentSortedInformationIndex].append(ascendedInformation[currentCheckIndex])
                    currentGymVisitDate = ascendedInformation[currentCheckIndex].gymVisitDate
                }
                currentCheckIndex += 1
            }
        
            printDataNum(sortedVideoInformation: sortedInformation)
            
            var secondSortedInformation: [[VideoInfoForDummy]] = []
            
            currentSortedInformationIndex = -1
            
            if !isAscend {
                sortedInformation.reverse()
            }
            
            print(sortedInformation.count)
            for index in 0..<sortedInformation.count {
                
                if sortedInformation[index].count == 0 {
                    continue
                }
                
                let temp1dArray = sortedInformation[index].sorted(by: { $0.gymName < $1.gymName })
                currentCheckIndex = 0
                var currentGymName = temp1dArray[currentCheckIndex].gymName
                
                secondSortedInformation.append([])
                currentSortedInformationIndex += 1
                while currentCheckIndex != temp1dArray.count {
                    
                    if temp1dArray[currentCheckIndex].gymName == currentGymName {
                        secondSortedInformation[currentSortedInformationIndex].append(temp1dArray[currentCheckIndex])
                    } else {
                        secondSortedInformation.append([])
                        currentSortedInformationIndex += 1
                        secondSortedInformation[currentSortedInformationIndex].append(temp1dArray[currentCheckIndex])
                        currentGymName = temp1dArray[currentCheckIndex].gymName
                    }
                    currentCheckIndex += 1
                }
            }
            printAllData(sortedVideoInformation: secondSortedInformation)
            return secondSortedInformation
            
        }
        
    }
    
    func printData(info: VideoInfoForDummy) {
        print("\(info.gymName) | \(info.gymVisitDate)일 | \(info.videoUrl) \(info.problemLevel)난이도 | 즐겨찾기 \(info.isFavorite) | 성공 \(info.isSucceeded)")
    }
    
    func printAllData(sortedVideoInformation: [[VideoInfoForDummy]]) {
        var counter: Int = 0
        print("------------------------")
        for i in 0..<sortedVideoInformation.count {
            for j in 0..<sortedVideoInformation[i].count {
                printData(info: sortedVideoInformation[i][j])
                counter += 1
            }
        }
        print("------------------------")
        print("COUNTED FOR \(counter)")
    }
    
    func printDataNum(sortedVideoInformation: [[VideoInfoForDummy]]) -> Int {
        var counter: Int = 0
        for i in 0..<sortedVideoInformation.count {
            for j in 0..<sortedVideoInformation[i].count {
                printData(info: sortedVideoInformation[i][j])
                counter += 1
            }
        }
        return counter
    }
}

// TODO: isFavorite, isSucceeded 케이스에 대해서도 분류하는 메소드 만들기
// TODO: 날짜별 분류인 경우 필연적으로 발생하는 암장 2개 이상을 집어넣는 케이스를 어떻게 Sorting할 것인지
// TODO: Struct에서 들고오는 Property가 달라져서, 반복되는 메소드이지만 케이스 분리를 해야만해서 코드가 길어지는 케이스를 어떤 식으로 Handling할 것인지
// TODO: CoreData인 경우에도 안정적으로 돌아가는지 테스트해보기 (Date Random Generating과 관련해서 공수 산정이 길어질 것 같아서 임시 Struct로 했던 부분을 어떻게든 해결해서 테스트...!)
