//
//  VideoInfoForDummy.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/21.
//

import Foundation

struct VideoInfoForDummy {
    var gymName: String
    var gymVisitDate: Int
    var videoUrl: String
    var problemLevel: Int
    var isSucceeded: Bool
    var isFavorite: Bool
    
    func sortedStandard(_ standard: SortValue) -> String {
        switch standard {
        case .gymName:
            return self.gymName
        case .gymVisitDate:
            return ""//self.gymVisitDate
        }
    }
}
