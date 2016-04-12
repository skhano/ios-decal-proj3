//
//  PhotoViewController.swift
//  Photos
//
//  Created by Sam Khano on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var image: Photo!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var likes: UILabel!

    @IBOutlet weak var heartState: UIButton!
    
    @IBAction func userLikedPhoto(sender: AnyObject) {
        heartState.setImage(UIImage(named: "filledHeart.png"), forState: UIControlState.Normal)
        image.likes = image.likes + 1
        likes.text = "\(image.likes) Likes"
    }
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageForCell(image, imageView: photo)
        heartState.setImage(UIImage(named: "emptyHeart.png"), forState: UIControlState.Normal)
        likes.text = "\(image.likes) Likes"
        userName.text = image.userName
        date.text = "\(image.postDate)"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: photo.url)!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                imageView.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
