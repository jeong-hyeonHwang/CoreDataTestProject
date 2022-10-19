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
    var videoName: String
    var problemLevel: Int
    var isSucceed: Bool
    var feedback: String
    var isFavorite: Bool
    
    init(gymName: String, gymVisitDate: Date, videoName: String, problemLevel: Int, isSucceed: Bool, isFavorite: Bool) {
        self.gymName = gymName
        self.gymVisitDate = gymVisitDate
        self.videoName = videoName
        self.problemLevel = problemLevel
        self.isSucceed = isSucceed
        self.feedback = ""
        self.isFavorite = isFavorite
    }
}
