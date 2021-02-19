//
//  AppConstant.swift
//  Kids-LearnWithFun2
//
//  Created by sheetal shinde on 30/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import Foundation
import UIKit

class CommanArray {
    static var houseHoldThingsImageArray: [UIImage] = [
        UIImage(named: "Living Room.png")!,
        UIImage(named: "Door.png")!,
        UIImage(named: "Gate.png")!,
        UIImage(named: "Kitchen.png")!,
        UIImage(named: "Bathroom.png")!,
        UIImage(named: "Staircase.png")!,
        UIImage(named: "Corridor.png")!,
        UIImage(named: "Window.png")!,
        UIImage(named: "Bed.png")!,
        UIImage(named: "Sofa.png")!,
        UIImage(named: "Curtain.png")!,
        UIImage(named: "Table.png")!,
        UIImage(named: "Stool.png")!,
        UIImage(named: "Chair.png")!,
        UIImage(named: "Wardrobe.png")!,
        UIImage(named: "Swing.png")!,
        UIImage(named: "Air Cooler.png")!,
        UIImage(named: "Fan.png")!,
        UIImage(named: "Air Conditioner.png")!,
        UIImage(named: "Door Mat.png")!,
        UIImage(named: "Ladder.png")!,
        UIImage(named: "Mirror.png")!,
        UIImage(named: "Broom.png")!,
        UIImage(named: "Dustbin.png")!,
        UIImage(named: "Telephone.png")!
    ]
    static var houseHoldThingsNameArray: [String] = ["Living Room","Door","Gate","Kitchen","Bathroom","Staircase","Corridor","Window","Bed","Sofa","Curtain","Table","Stool","Chair","Wardrobe","Swing","Air Cooler","Fan","Air Conditioner","Door Mat","Ladder","Mirror","Broom","Dustbin","Telephone"]
    //------------------------------------------------------------------------
    static var kitchenUtensilsImageArray: [UIImage] = [
        UIImage(named: "Pan.png")!,
        UIImage(named: "Pitcher.png")!,
        UIImage(named: "Pressure Cooker.png")!,
        UIImage(named: "Plate.png")!,
        UIImage(named: "Glass.png")!,
        UIImage(named: "Cauldron.png")!,
        UIImage(named: "Lid.png")!,
        UIImage(named: "Cup.png")!,
        UIImage(named: "Saucer.png")!,
        UIImage(named: "Teapot.png")!,
        UIImage(named: "Spoon.png")!,
        UIImage(named: "Fork.png")!,
        UIImage(named: "Sieve.png")!,
        UIImage(named: "Strainer.png")!,
        UIImage(named: "Rolling Pad.png")!,
        UIImage(named: "Rolling Pin.png")!,
        UIImage(named: "Skimmer.png")!,
        UIImage(named: "Ladle.png")!,
        UIImage(named: "Grater.png")!,
        UIImage(named: "Bowl.png")!
    ]
    //"Teapot"
    static var kitchenUtensilsNameArray: [String] = ["Pan","Pitcher",
                                                     "Pressure Cooker","Plate","Glass","Cauldron","Lid","Cup","Saucer","Teapot","Spoon","Fork","Sieve","Strainer","Rolling Pad","Rolling Pin","Skimmer","Ladle","Grater","Bowl"]
    //------------------------------------------------------------------------
    static var gardeningImageArray: [UIImage] = [
        UIImage(named: "Axe.png")!,
        UIImage(named: "Cultivator.png")!,
        UIImage(named: "Garden Gloves.png")!,
        UIImage(named: "Hand Fork.png")!,
        UIImage(named: "Hedge Shears.png")!,
        UIImage(named: "Hose.png")!,
        UIImage(named: "Prunning Saw.png")!,
        UIImage(named: "Shovel.png")!,
        UIImage(named: "Spade.png")!,
        UIImage(named: "Trowel.png")!,
        UIImage(named: "Wheelbarrow.png")!,
        UIImage(named: "Watering Can.png")!,
        UIImage(named: "Gardening Boots.png")!
    ]
    static var gardeningNameArray: [String] = ["Axe",
        "Cultivator","Garden Gloves","Hand Fork","Hedge Shears","Hose","Prunning Saw","Shovel","Spade","Trowel","Wheelbarrow","Watering Can","Gardening Boots"]
    //------------------------------------------------------------------------
    static var schoolImageArray: [UIImage] = [
        UIImage(named: "Book.png")!,
        UIImage(named: "Notebook.png")!,
        UIImage(named: "Pen.png")!,
        UIImage(named: "Pencil.png")!,
        UIImage(named: "Eraser.png")!,
        UIImage(named: "Sharpner.png")!,
        UIImage(named: "Ruler.png")!,
        UIImage(named: "Protractor.png")!,
        UIImage(named: "Geometry Compass.png")!,
        UIImage(named: "Set Square.png")!,
        UIImage(named: "Measuring Divider.png")!,
        UIImage(named: "Writing Pad.png")!,
        UIImage(named: "White Board.png")!,
        UIImage(named: "School Bag.png")!,
        UIImage(named: "Stapler.png")!,
        UIImage(named: "Paper Punching Machine.png")!,
        UIImage(named: "Map.png")!,
        UIImage(named: "Computer.png")!,
        UIImage(named: "Printer.png")!,
        UIImage(named: "Pen Drive.png")!
    ]
    static var schoolNameArray: [String] = ["Book","Notebook","Pen","Pencil","Eraser","Sharpner","Ruler","Protractor","Geometry Compass","Set Square","Measuring Divider","Writing Pad","White Board","School Bag","Stapler","Paper Punching Machine","Map","Computer","Printer","Pen Drive"]
    //------------------------------------------------------------------------
    static var status_Sign_Array = [
        UIImage(named: "Wrong-Sign.png")!,
        UIImage(named: "Right-Sign.png")!
    ]
    
    static var imgCancelSubscription = UIImage(named: "PaymentDetail.png")!
    static var imgCancelSubscription1 = UIImage(named: "PaymentDetail-1.png")!
    static var imgSoundOn = UIImage(named: "Sound-On_home.png")!
    static var imgSoundOff = UIImage(named: "Sound-Off_home.png")!
    static var imageRadioCheck = UIImage(named: "radio_check.png")
    static var imageRadioUncheck = UIImage(named: "radio_uncheck.png")


    //------------------------------------------------------------------------
    //Related to review and rating
    static let app_AppStoreLink = URL(string: "https://apps.apple.com/app/id1553674656")

    
    //Colors
    static var settingBgColor = UIColor(red: (255/255), green: (103/255), blue: (0/255), alpha: 1.0)
    static var paymentModeBgColor = UIColor(red: (255/255), green: (116/255), blue: (2/255), alpha: 1.0)
    static var paymentBtnTextColor = UIColor(red: (255/255), green: (116/255), blue: (2/255), alpha: 1.0)

    //Related to Ads Production
//    static var Banner_AdUnitId = "ca-app-pub-7546454767986772/2971046998"
//    static var Interstitial_AdUnitId = "ca-app-pub-7546454767986772/7578066918"
//    static var Ad_App_ID = "ca-app-pub-7546454767986772~6951380954"
    
    
    
    //Related to Ads Sandbox/Test
     static var Banner_AdUnitId = "ca-app-pub-3940256099942544/2934735716"
     static var Interstitial_AdUnitId = "ca-app-pub-3940256099942544/4411468910"
     static var Ad_App_ID = "ca-app-pub-3940256099942544~1458002511"
    
    //Related to InAppPurchase
    static var environment = AppleReceiptValidator.VerifyReceiptURLType.production
    static var secretKey = "b080c7b91bbe48c4aed2b29eb89c9f7c"
    
    static var productId_Year_Auto_Recurring = "com.mobiapps360.LearnHouseObjects.YearlyAutoRecurring"
    static var productId_Year_Non_Recurring = "com.mobiapps360.LearnHouseObjects.YearlyNonRecurring"
    static var productId_Month_Auto_Recurring = "com.mobiapps360.LearnHouseObjects.MonthlyAutoRecurring"
    static var productId_Month_Non_Recurring = "com.mobiapps360.LearnHouseObjects.MonthlyNonRecurring"


}
/**
 * Check if internet connection is available
 */
class Reachability {
    class func isConnectedToNetwork() -> Bool {
        var status:Bool = false
        let url = NSURL(string: "http://google.com")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "HEAD"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        var response1:URLResponse?
        
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            response1 = response
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        if let httpResponse = response1 as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                status = true
            }
        }
        return status
      }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
