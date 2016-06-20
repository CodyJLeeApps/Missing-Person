//
//  FaceService.swift
//  MissingPersons
//
//  Created by Cody Lee on 6/18/16.
//  Copyright © 2016 CJLee Apps. All rights reserved.
//

import Foundation
import ProjectOxfordFace


class FaceService {
    static let instance = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "deb544694ae149938c8b18f9dab98c3b")
}