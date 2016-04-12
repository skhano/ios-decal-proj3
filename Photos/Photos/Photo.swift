//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var userName : String!
    /* The data that the photo was posted. */
    var postDate : String!
    
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {

        userName = data.valueForKey("user")?.valueForKey("username") as! String
        url = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        
        let currDate = data.valueForKey("created_time") as! String
        let date = NSDate(timeIntervalSince1970: Double(currDate)!)
        let format = NSDateFormatter()
        format.dateStyle = .MediumStyle
        postDate = format.stringFromDate(date)
    }

}