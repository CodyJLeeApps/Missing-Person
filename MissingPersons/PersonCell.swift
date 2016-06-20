//
//  PersonCell.swift
//  MissingPersons
//
//  Created by Cody Lee on 6/18/16.
//  Copyright © 2016 CJLee Apps. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    var person: Person!
    
    func configureCell(person: Person) {
        self.person = person
        if let url = NSURL(string: "\(baseURL)\(person.personImageUrl!)") {
            downloadImage(url)
        }
    }
    
    func downloadImage(url: NSURL) {
        getDatafromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.personImage.image = UIImage(data: data)
                self.person.personImage = self.personImage.image
            }
        }
    }
    
    func getDatafromUrl(url: NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
        }.resume()
        
    }
    
    func setSelected() {
        
        personImage.layer.borderWidth = 2.0
        personImage.layer.borderColor = UIColor.blueColor().CGColor
        
        self.person.downloadFaceId()
    }
    
}
