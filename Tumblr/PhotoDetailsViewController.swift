//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Brett Stevenson on 9/22/19.
//  Copyright © 2019 Brett Stevenson. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    var post: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let photos = post["photos"] as? [[String: Any]] {
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
    
            photoImageView.af_setImage(withURL: url!)
        }
        
        let avatarUrl = URL(string: "https://api.tumblr.com/v2/blog/highclasscars.tumblr.com/avatar?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        // Round avatar imageView
        avatarImageView.af_setImage(withURL: avatarUrl)
        avatarImageView.layer.borderWidth=1.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.clipsToBounds = true
        
        titleLabel.text = post["blog_name"] as! String
        
        publishedLabel.text = post["date"] as? String
//        let dateString = post["date"] as! String
//        let df = DateFormatter()
//        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        df.timeZone = TimeZone(abbreviation: "GMT")
//        df.locale = Locale(identifier: "en_US_POSIX")
//        let date = df.date(from: dateString)!
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
//        publishedLabel.text = formatter.string(from: date)
        
        let caption = post["caption"] as! String
        captionLabel.text = caption.stripHTML()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String {
    /**
    Takes the current String struct and strips out HTML using regular expression. All tags get stripped out.
    :returns: String html text as plain text
    */
    func stripHTML() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: NSString.CompareOptions.regularExpression, range: nil)
    }
}

extension DateFormatter {
  func date(fromSwapiString dateString: String) -> Date? {
    // SWAPI dates look like: "2014-12-10T16:44:31.486000Z"
    self.dateFormat = "yyyy-MM-dd HH:mm:ss.SZ"
    self.timeZone = TimeZone(abbreviation: "GMT")
    self.locale = Locale(identifier: "en_US_POSIX")
    return self.date(from: dateString)
  }
}
