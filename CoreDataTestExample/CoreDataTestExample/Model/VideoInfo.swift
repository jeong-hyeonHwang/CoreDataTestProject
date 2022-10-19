//
//  VideoInfo.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/19.
//

import Foundation

struct VideoInfo {
    var gymName: String
    var gymVisitDate: Date
    var videoUrl: String
    var problemLevel: Int
    var isSucceeded: Bool
    var feedback: String
    var isFavorite: Bool
    
    init(gymName: String, gymVisitDate: Date, videoUrl: String, problemLevel: Int, isSucceeded: Bool) {
        self.gymName = gymName
        self.gymVisitDate = gymVisitDate
        self.videoUrl = videoUrl
        self.problemLevel = problemLevel
        self.isSucceeded = isSucceeded
        self.isFavorite = false
        self.feedback = ""
    }
}
