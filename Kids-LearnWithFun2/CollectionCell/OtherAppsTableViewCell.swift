//
//  OtherAppsTableViewCell.swift
//  Learn House Objects
//
//  Created by Sheetal Ghatkar on 30/03/21.
//  Copyright © 2021 sheetal shinde. All rights reserved.
//

import UIKit

class OtherAppsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageviewAppIcon: UIImageView!
    @IBOutlet weak var lblAppIcon: UILabel!
    @IBOutlet weak var lblAppName: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnGetNow: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageviewAppIcon.layer.cornerRadius = 10.0
        self.imageviewAppIcon.layer.masksToBounds = true
       /* self.viewContainer.layer.shadowPath = UIBezierPath(rect: viewContainer.bounds).cgPath
        self.viewContainer.layer.shadowRadius = 5
        self.viewContainer.layer.shadowColor = UIColor.black.cgColor
        self.viewContainer.layer.shadowOffset = .zero
            //CGSize(width: 4.0,height: 4.0)
        self.viewContainer.layer.shadowOpacity = 1
        self.viewContainer.layer.masksToBounds = false*/
        
        
       /* self.viewContainer.layer.masksToBounds = false
        //self.viewContainer.layer.cornerRadius = self.frame.height/2
        self.viewContainer.layer.shadowColor = UIColor.black.cgColor
        self.viewContainer.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
        self.viewContainer.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.viewContainer.layer.shadowOpacity = 0.5
        self.viewContainer.layer.shadowRadius = 1.0*/
        self.viewContainer.layer.cornerRadius = 15

        // border
//        self.viewContainer.layer.borderWidth = 1.0
//        self.viewContainer.layer.borderColor = UIColor.black.cgColor

        // shadow
        self.viewContainer.layer.shadowColor = UIColor.gray.cgColor
        self.viewContainer.layer.shadowOffset = CGSize(width: 2, height: 2)
//        self.viewContainer.layer.shadowPath = UIBezierPath(roundedRect:  CGRect(x: 0, y: 0, width: self.bounds.width-1, height: self.bounds.height-1), cornerRadius: 10).cgPath

        self.viewContainer.layer.shadowOpacity = 0.5
        self.viewContainer.layer.shadowRadius = 0.1
        self.viewContainer.layer.masksToBounds = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.linkClicked(sender:)))
        lblAppIcon.isUserInteractionEnabled = true
        viewContainer.addGestureRecognizer(tap)
        btnGetNow.setTitle("Get Now", for: .normal)
        btnGetNow.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        btnGetNow.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btnGetNow.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btnGetNow.layer.shadowOpacity = 1.0
        btnGetNow.layer.shadowRadius = 0.0
        btnGetNow.layer.masksToBounds = false
        btnGetNow.layer.cornerRadius = 4.0

    }
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc func linkClicked(sender:UITapGestureRecognizer) {
        sender.view?.alpha = 0.5
        openUrl(urlStr: lblAppIcon.text)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.view?.alpha = 1.0
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
