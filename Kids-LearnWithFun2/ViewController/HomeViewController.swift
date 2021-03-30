//
//  HomeViewController.swift
//  Kids-LearnWithFun
//
//  Created by sheetal shinde on 14/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    @IBOutlet weak var bgScreen: UIImageView!
    @IBOutlet weak var imgVwWildAnimal: UIImageView!
    @IBOutlet weak var imgVwPetAnimal: UIImageView!
    @IBOutlet weak var imgVwBird: UIImageView!
    @IBOutlet weak var imgVwFlower: UIImageView!
    @IBOutlet weak var imgVwTest: UIImageView!
    @IBOutlet weak var imgViewBg: UIImageView!
    
    @IBOutlet weak var imgViewBottomGif1: UIImageView!
    @IBOutlet weak var imgViewBottomGif2: UIImageView!
    @IBOutlet weak var imgViewBottomGif3: UIImageView!

    
    @IBOutlet weak var lblHouse: UILabel!
    @IBOutlet weak var lblKitchen: UILabel!
    @IBOutlet weak var lblGardeningTools: UILabel!
    @IBOutlet weak var lblStationeryItems: UILabel!
    @IBOutlet weak var lblTest: UILabel!
    
    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var btnNoAds: UIButton!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var btnCancelSubscription: UIButton!
//    @IBOutlet weak var widthHouseImg: NSLayoutConstraint!
    @IBOutlet weak var  WidthSound: NSLayoutConstraint!
    @IBOutlet weak var widthHouseImg: NSLayoutConstraint!
    @IBOutlet weak var WidthLblGardenImg: NSLayoutConstraint!
    @IBOutlet weak var heightLblGardenImg: NSLayoutConstraint!

    var fromShareApp = false
    var isUpdateAvaible = false

    @IBOutlet weak var floaty : Floaty!
        {
        didSet {
            floaty.buttonImage = UIImage(named: "map_hashtag_gray")
        }
    }
    var paymentDetailVC : PaymentDetailViewController?

    var fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 24)
    let rateUsImg = UIImage(named: "RateUs.png")
    let shareAppImg = UIImage(named: "ShareApp.png")
    let otherAppsImg = UIImage(named: "OtherApps.png")
    let updateAppImg = UIImage(named: "UpdateApp.png")

    var player = AVAudioPlayer()
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let defaults = UserDefaults.standard
    @IBOutlet weak var viewParentSetting: UIView!
    @IBOutlet weak var viewtransperent: UIView!

    //------------------------------------------------------------------------

    override func viewDidAppear(_ animated: Bool) {
        if appDelegate.IS_Sound_ON {
            playBackgroundMusic()
        } else {
            player.stop()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognWildAnimal = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwWildAnimal.addGestureRecognizer(tapGestureRecognWildAnimal)
        imgVwWildAnimal.tag = 1

        let tapGestureRecognPetAnimal = UITapGestureRecognizer(
            target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwPetAnimal.addGestureRecognizer(tapGestureRecognPetAnimal)
        imgVwPetAnimal.tag = 2

        let tapGestureRecognBird = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwBird.addGestureRecognizer(tapGestureRecognBird)
        imgVwBird.tag = 3


        let tapGestureRecognFlower = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwFlower.addGestureRecognizer(tapGestureRecognFlower)
        imgVwFlower.tag = 4
        
        
        let tapGestureRecognTest = UITapGestureRecognizer(target: self, action: #selector(testImageTapped(tapGestureRecognizer:)))
        imgVwTest.addGestureRecognizer(tapGestureRecognTest)
        if defaults.bool(forKey:"PauseHomeSound") {
            btnSound.setBackgroundImage(CommanArray.imgSoundOff, for: .normal)
        } else {
            btnSound.setBackgroundImage(CommanArray.imgSoundOn, for: .normal)
        }
        viewParentSetting.backgroundColor = UIColor.black
        viewParentSetting.alpha = 0.4

        self.viewtransperent.isHidden = true
        self.viewParentSetting.isHidden = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.clickTransperentView (_:)))
        self.viewParentSetting.addGestureRecognizer(gesture)
        self.floaty.floatingActionButtonDelegate = self
        self.floaty.addItem(icon: rateUsImg, handler: { [self]_ in
            self.floaty.close()
            self.appstoreRateAndReview()
           /* self.paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
            self.paymentDetailVC?.showHomeScreenRateReview = true
            self.showPaymentScreen()*/
        })
        self.floaty.addItem(icon: shareAppImg, handler: {_ in
            self.floaty.close()
            self.shareApp()
           /* self.paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
            self.paymentDetailVC?.showHomeScreenShareApp = true
            self.showPaymentScreen()
            self.floaty.close()*/
        })
        self.floaty.addItem(icon: otherAppsImg, handler: { [self]_ in
            self.floaty.close()
            let otherAppsVC = OtherAppsViewController(nibName: "OtherAppsViewController", bundle: nil)
            self.navigationController?.pushViewController(otherAppsVC, animated: true)
        })
        floaty.items[0].title = "Rate & Review"
        floaty.items[1].title = "Share App"
        floaty.items[2].title = "Our Other Apps"
        
        isUpdateAvaible = checkForAppUpdate()

        if isUpdateAvaible {
            self.floaty.addItem(icon: updateAppImg, handler: {_ in
                self.floaty.close()
                self.redirectToAppStoreForUpdate()
            })
            floaty.items[3].title = "Update App"
        }

//        self.floaty.addItem(icon: contactUsImg, handler: { [self]_ in
//            let mailComposeViewController = configureMailComposer()
//              if MFMailComposeViewController.canSendMail(){
//                  self.present(mailComposeViewController, animated: true, completion: nil)
//              }else{
//                  print("Can't send email")
//                let alert = UIAlertController(title: "", message: "Please setup mail account.", preferredStyle: UIAlertController.Style.alert)
//
//                // add an action (button)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//                // show the alert
//                self.present(alert, animated: true, completion: nil)
//
//              }
//            self.floaty.close()
//        })

//        floaty.items[2].title = "Contact Us"
        
        addWaveBackground(to :viewtransperent)
        //-----------------------------------
        if self.defaults.bool(forKey: "IsPrimeUser") {
            handlingdForPrimeIser()
        }
        
        if !(UIDevice.current.hasNotch) {
            self.WidthSound.constant = 36
            widthHouseImg.constant = 100
        }
        
        let loaderGif1 = UIImage.gifImageWithName("animated-clipart-house")
        let loaderGif2 = UIImage.gifImageWithName("animated-clipart-house")

        imgViewBottomGif1.image = loaderGif1
        imgViewBottomGif2.image = loaderGif2
//        imgViewBottomGif3.image = loaderGif
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            self.WidthSound.constant = 45
            self.floaty.isHidden = true
            self.btnSetting.isHidden = true
            widthHouseImg.constant = 150
            if UIScreen.main.bounds.height > 1100 {
                self.WidthSound.constant = 52
                widthHouseImg.constant = 200
                WidthLblGardenImg.constant = 300
                heightLblGardenImg.constant = 160
                fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 42)
            }
        }
        imgVwWildAnimal.layer.cornerRadius = (widthHouseImg.constant)/2
        imgVwPetAnimal.layer.cornerRadius = (widthHouseImg.constant)/2
        imgVwBird.layer.cornerRadius = (widthHouseImg.constant)/2
        imgVwFlower.layer.cornerRadius = (widthHouseImg.constant)/2
        imgVwTest.layer.cornerRadius = (widthHouseImg.constant)/2

        
        lblHouse.font = fontImageTitleLbl
        lblKitchen.font = fontImageTitleLbl
        lblGardeningTools.font = fontImageTitleLbl
        lblStationeryItems.font = fontImageTitleLbl
        lblTest.font = fontImageTitleLbl
        
    }
    func redirectToAppStoreForUpdate() {
        let components = URLComponents(url: CommanArray.app_AppStoreLink!, resolvingAgainstBaseURL: false)
        
        guard let writeReviewURL = components?.url else {
          return
        }
        UIApplication.shared.open(writeReviewURL)
    }
    func checkForAppUpdate() -> Bool {
        if Reachability.isConnectedToNetwork() {
            let infoDictionary = Bundle.main.infoDictionary
            let appID = infoDictionary!["CFBundleIdentifier"] as! String
            guard let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(appID)") else { return false }
            guard let data = try? Data(contentsOf: url) else {
              print("There is an error!")
              return false;
            }
            let lookup = (try? JSONSerialization.jsonObject(with: data , options: [])) as? [String: Any]
            if let resultCount = lookup!["resultCount"] as? Int, resultCount == 1 {
                if let results = lookup!["results"] as? [[String:Any]] {
                    if let appStoreVersion = results[0]["version"] as? String{
                        let currentVersion = infoDictionary!["CFBundleShortVersionString"] as? String
                        if !(appStoreVersion == currentVersion) {
                            print("Need to update [\(appStoreVersion) != \(currentVersion)]")
                            return true
                        }
                    }
                }
            }
            return false
        } else {
            return false
        }
    }
    
    func daysRemainingOnSubscription(getExpireDate: Date) -> Int {

        return Calendar.current.dateComponents([.day], from: Date(), to: getExpireDate).day!
    }
    
    func isRefreshRequired() -> Bool {

        guard let lastRefreshDate = defaults.object(forKey: "RefreshedDate") as? Date else {
            return true
        }

        if let diff = Calendar.current.dateComponents([.hour], from: lastRefreshDate, to: Date()).hour, diff > 24 {
            return true
        } else {
            return false
        }
    }
    
    func handlingdForPrimeIser() {
      let getPurchaseDetails = self.defaults.value(forKey: "PurchaseDetails") as? [String:String]
      if getPurchaseDetails != nil {
        if ((getPurchaseDetails!.count != 0) && ((getPurchaseDetails!["CancellationDate"])!.count) != 0) {
            defaults.set(false, forKey: "IsPrimeUser")
            showHideAdsButton()
        } else if ((getPurchaseDetails!.count != 0) && (getPurchaseDetails!["ProductId"] == CommanArray.productId_Year_Non_Recurring) && ((getPurchaseDetails!["ExpirationDate"])!.count) != 0) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let getExpireDate = formatter.date(from: (getPurchaseDetails?["ExpirationDate"]!)! as String)!
            let getRemainingDays = daysRemainingOnSubscription(getExpireDate: getExpireDate)
            if getRemainingDays >= 0 {
                if getRemainingDays == 0 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your yearly subscription is expiring today.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else if getRemainingDays < 6 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your yearly subscription will expire in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else {
                defaults.set(false, forKey: "IsPrimeUser")
            }
            showHideAdsButton()
        } else if ((getPurchaseDetails!.count != 0) && (getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Non_Recurring) && ((getPurchaseDetails!["ExpirationDate"])!.count) != 0) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let getExpireDate = formatter.date(from: getPurchaseDetails!["ExpirationDate"]! as String)!
            let getRemainingDays = daysRemainingOnSubscription(getExpireDate: getExpireDate)
            if getRemainingDays >= 0 {
                if getRemainingDays == 0 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your monthly subscription is expiring today.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else if getRemainingDays < 6 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your monthly subscription will expire in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else {
                defaults.set(false, forKey: "IsPrimeUser")
            }
            showHideAdsButton()
        } else if((getPurchaseDetails!.count != 0) && ((getPurchaseDetails!["ProductId"] == CommanArray.productId_Year_Auto_Recurring)||(getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Auto_Recurring)) && ((getPurchaseDetails!["SubscriptionExpirationDate"])!.count) != 0) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let getExpireDate = formatter.date(from: getPurchaseDetails!["SubscriptionExpirationDate"]! as String)!
            let getRemainingDays = daysRemainingOnSubscription(getExpireDate: getExpireDate)
            if getRemainingDays >= 0 {
                if ((getRemainingDays == 1)||(getRemainingDays == 2)) {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        if (getPurchaseDetails!["ProductId"] == CommanArray.productId_Year_Auto_Recurring) {
                            let alert = UIAlertController(title: "", message: "Your yearly subscription will renew in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        } else if (getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Auto_Recurring) {
                            let alert = UIAlertController(title: "", message: "Your monthly subscription will renew in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                showHideAdsButton()
            } else {
                var productIdAutoRenew = ""
                var productPriceAutoRenew = ""
                if (getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Auto_Recurring) {
                    productIdAutoRenew = CommanArray.productId_Month_Auto_Recurring
                    productPriceAutoRenew = "$0.49"
                } else {
                    productIdAutoRenew = CommanArray.productId_Year_Auto_Recurring
                    productPriceAutoRenew = "$3.99"
                }
                let appleValidator = AppleReceiptValidator(service: CommanArray.environment, sharedSecret: CommanArray.secretKey)
                SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                    switch result {
                    case .success(let receipt):
                        let purchaseResult = SwiftyStoreKit.verifySubscription(
                            ofType: .autoRenewable,
                            productId: productIdAutoRenew,
                            inReceipt: receipt)
                            
                        switch purchaseResult {
                        case .purchased(let expiryDate, let items):
                            let getReceiptItem = items[0] as ReceiptItem
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            let pucrhaseDateString = formatter.string(from: getReceiptItem.purchaseDate as Date)
                            let originalPurchasedDateString = formatter.string(from: getReceiptItem.originalPurchaseDate as Date)
                            var subscriptionExpirationDateString = ""
                            if getReceiptItem.subscriptionExpirationDate != nil {
                                subscriptionExpirationDateString = formatter.string(from: getReceiptItem.subscriptionExpirationDate! as Date)
                            }
                            var expirationDateString = ""
                            expirationDateString = formatter.string(from: expiryDate as Date)

                            var cancelDateString = ""
                            if getReceiptItem.cancellationDate != nil {
                                cancelDateString = formatter.string(from: getReceiptItem.cancellationDate! as Date)
                            }
                            let dictPurchaseDetail = [
                                "ProductId": productIdAutoRenew,
                                "OriginalPurchasedDate": originalPurchasedDateString,
                                "PurchasedDate": pucrhaseDateString,
                                "ExpirationDate": expirationDateString,
                                "CancellationDate": cancelDateString,
                                "SubscriptionExpirationDate": subscriptionExpirationDateString,
                                "SubscriptionPrice":productPriceAutoRenew
                            ] as [String:Any]
                            self.defaults.set(dictPurchaseDetail, forKey: "PurchaseDetails")
                            self.defaults.set(true, forKey: "IsPrimeUser")
                        case .expired( _,  _):
                            self.defaults.set(false, forKey: "IsPrimeUser")
                        case .notPurchased:
                            self.defaults.set(false, forKey: "IsPrimeUser")
                        }
                        self.showHideAdsButton()
                    case .error(let error):
                        print("Receipt verification failed: \(error)")
                    }
                }
            }
        }
      }
    }
    @objc func appDidEnterBackground() {
        // stop counter
        floaty.close()
    }
    @objc func clickTransperentView(_ sender:UITapGestureRecognizer){
        self.viewtransperent.isHidden = true
        self.viewParentSetting.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        playBackgroundMusic()
        showHideAdsButton()
    }
    func addWaveBackground(to view: UIView){
        let multipler = CGFloat(0.1)  //0.13
        var leftDrop : CGFloat = 0.0
        var leftInflexionX : CGFloat = 0.0
        var leftInflexionY : CGFloat = 0.0

        if isUpdateAvaible {
            leftDrop = 0.5 + multipler
            leftInflexionX = 0.5 + multipler
            leftInflexionY = 0.57 + multipler
        } else {
            leftDrop = 0.45 + multipler
            leftInflexionX = 0.45 + multipler
            leftInflexionY = 0.52 + multipler
        }
        var rightDrop : CGFloat = 0.0
        var rightInflexionX : CGFloat = 0.0
        var rightInflexionY : CGFloat = 0.0

        if isUpdateAvaible {
           rightDrop  = 0.4 +  multipler
           rightInflexionX = 0.7  +  multipler
           rightInflexionY = 0.25 + multipler
        } else {
            rightDrop = 0.37 +  multipler
            rightInflexionX = 0.65  +  multipler
            rightInflexionY = 0.20 + multipler
        }


          let backView = UIView(frame: view.frame)
          backView.backgroundColor = .clear
          view.addSubview(backView)
          let backLayer = CAShapeLayer()
          let path = UIBezierPath()
          path.move(to: CGPoint(x: 0, y: 0))
          path.addLine(to: CGPoint(x:0, y: view.frame.height * leftDrop))
          path.addCurve(to: CGPoint(x:250, y: view.frame.height * rightDrop),
                        controlPoint1: CGPoint(x: view.frame.width * leftInflexionX, y: view.frame.height * leftInflexionY),
                        controlPoint2: CGPoint(x: view.frame.width * rightInflexionX, y: view.frame.height * rightInflexionY+30))
//          path.addLine(to: CGPoint(x:225, y: 0))
        path.addLine(to: CGPoint(x:250, y: 0))

          path.close()
          backLayer.fillColor = CommanArray.settingBgColor.cgColor //UIColor.blue.cgColor
          backLayer.path = path.cgPath
          backView.layer.addSublayer(backLayer)
    }
    @IBAction func funcNoAds(_ sender: Any) {
        paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
        paymentDetailVC?.showSubscriptionScreen = false
        showPaymentScreen()
    }

    func showHideAdsButton() {
        if defaults.bool(forKey:"IsPrimeUser") {
            if let _ = btnCancelSubscription, let _ = btnCancelSubscription {
                self.btnCancelSubscription.isHidden = false
                self.btnNoAds.isHidden = true
            }
        } else {
            if let _ = btnCancelSubscription, let _ = btnCancelSubscription {
                self.btnCancelSubscription.isHidden = true
                self.btnNoAds.isHidden = false
            }
        }
    }
    @IBAction func funcSound_ON_OFF(_ sender: Any) {
        if defaults.bool(forKey:"PauseHomeSound") {
            defaults.set(false, forKey: "PauseHomeSound")
            btnSound.setBackgroundImage(CommanArray.imgSoundOn, for: .normal)
            player.play()
        } else {
            defaults.set(true, forKey: "PauseHomeSound")
            btnSound.setBackgroundImage(CommanArray.imgSoundOff, for: .normal)
            player.stop()
        }
    }
    @objc func alarmAlertActivate(){
        UIView.animate(withDuration: 0.7) {
            self.imgVwTest.alpha = self.imgVwTest.alpha == 1.0 ? 0.0 : 1.0
        }
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let setPictureVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImagesCollectionViewController") as! ImagesCollectionViewController
        if tapGestureRecognizer.view?.tag == 1 {
            setPictureVC.imageArray = CommanArray.houseHoldThingsImageArray
            setPictureVC.imageNameArray = CommanArray.houseHoldThingsNameArray
            setPictureVC.getTabNumber = 0
        }
        else if tapGestureRecognizer.view?.tag == 2 {
            setPictureVC.imageArray = CommanArray.kitchenUtensilsImageArray
            setPictureVC.imageNameArray = CommanArray.kitchenUtensilsNameArray
            setPictureVC.getTabNumber = 1
        }
        else if tapGestureRecognizer.view?.tag == 3 {
            setPictureVC.imageArray = CommanArray.gardeningImageArray
            setPictureVC.imageNameArray = CommanArray.gardeningNameArray
            setPictureVC.getTabNumber = 2
        }
        else if tapGestureRecognizer.view?.tag == 4 {
            setPictureVC.imageArray = CommanArray.schoolImageArray
            setPictureVC.imageNameArray = CommanArray.schoolNameArray
            setPictureVC.getTabNumber = 3
        }
        self.navigationController?.pushViewController(setPictureVC, animated: true)
    }
    
    @objc func testImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let setPictureVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        self.navigationController?.pushViewController(setPictureVC, animated: true)
    }
    
    func playBackgroundMusic() {
        let path = Bundle.main.path(forResource: "BackgroundMusic", ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            if defaults.bool(forKey:"PauseHomeSound") {
                btnSound.setBackgroundImage(CommanArray.imgSoundOff, for: .normal)
                player.stop()
            } else {
                btnSound.setBackgroundImage(CommanArray.imgSoundOn, for: .normal)
                player.play()
            }

        } catch {
            print ("There is an issue with this code!")
        }
    }
    @IBAction func funcCancelSubscription(_ sender: Any) {
       if btnCancelSubscription.currentImage!.pngData() == (CommanArray.imgCancelSubscription).pngData() {
            btnCancelSubscription.setImage(CommanArray.imgCancelSubscription1, for: .normal)
        } else {
            btnCancelSubscription.setImage(CommanArray.imgCancelSubscription, for: .normal)
        }

        if fromShareApp {
            fromShareApp = false
        } else {
            paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
            paymentDetailVC?.showSubscriptionScreen = true
            showPaymentScreen()
        }
    }


}

extension HomeViewController : PayementForParentProtocol {
    //Delegate method implementation
    func showPaymentCostScreen() {
        paymentDetailVC?.view.removeFromSuperview()
        let paymentCostVC = PaymentCostController(nibName: "PaymentCostController", bundle: nil)
        self.navigationController?.pushViewController(paymentCostVC, animated: true)
    }
    
    func showSubscriptionDetailScreen() {
        paymentDetailVC?.view.removeFromSuperview()
        let paymenSubscriptionVC = SubscriptionDetailsController(nibName: "SubscriptionDetailsController", bundle: nil)
        self.navigationController?.pushViewController(paymenSubscriptionVC, animated: true)
    }

    func showPaymentScreen(){
        paymentDetailVC?.view.frame = self.view.bounds
        paymentDetailVC?.delegatePayementForParent = self
        self.view.addSubview(paymentDetailVC?.view ?? UIView())
    }
    
    func appstoreRateAndReview() {
        //paymentDetailVC?.view.removeFromSuperview()
        var components = URLComponents(url: CommanArray.app_AppStoreLink!, resolvingAgainstBaseURL: false)
        components?.queryItems = [
          URLQueryItem(name: "action", value: "write-review")
        ]
        guard let writeReviewURL = components?.url else {
          return
        }
        UIApplication.shared.open(writeReviewURL)
    }
    
    func shareApp() {
        paymentDetailVC?.view.removeFromSuperview()
        let activityViewController = UIActivityViewController(
            activityItems: [CommanArray.app_AppStoreLink!],
          applicationActivities: nil)
        activityViewController.completionWithItemsHandler = { (activity, success, items, error) in
             print(success ? "SUCCESS!" : "FAILURE")
            self.fromShareApp = true
            self.btnCancelSubscription.sendActions(for: .touchUpInside)
        }
        self.present(activityViewController, animated: true, completion: nil)
    }

}
extension HomeViewController : FloatingActionButtonProtocol {
    
    func floatingActionOpen() {
        UIView.animate(withDuration: 0.5, animations: {
            self.btnSetting.transform = CGAffineTransform(rotationAngle: .pi * 0.999)
        })
        viewtransperent.isHidden = false
        viewParentSetting.isHidden = false
    }
    func floatingActionClose() {
        UIView.animate(withDuration: 0.5, animations: {
            self.btnSetting.transform = CGAffineTransform.identity
        })
        viewtransperent.isHidden = true
        viewParentSetting.isHidden = true
    }
}
