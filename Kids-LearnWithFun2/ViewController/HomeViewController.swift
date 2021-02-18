//
//  HomeViewController.swift
//  Kids-LearnWithFun
//
//  Created by sheetal shinde on 14/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

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
    var fromShareApp = false


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

    var player = AVAudioPlayer()
//    var bannerView: GADBannerView!
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
       // let wildGif1 = UIImage.gifImageWithName("Bubble")
//        self.imgVwWild1Bottom.image  = wildGif1
        
//        let loaderGif = UIImage.gifImageWithName("Bubble")
//        imgViewBg.image = loaderGif

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

        
      /*  bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self*/
       // bannerView.load(GADRequest())
//        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        
        if defaults.bool(forKey:"PauseHomeSound") {
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off_home.png"), for: .normal)
        } else {
            btnSound.setBackgroundImage(UIImage(named: "Sound-On_home.png"), for: .normal)
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
            self.paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
            self.paymentDetailVC?.showHomeScreenRateReview = true
            self.showPaymentScreen()
        })
        self.floaty.addItem(icon: shareAppImg, handler: {_ in
            self.paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
            self.paymentDetailVC?.showHomeScreenShareApp = true
            self.showPaymentScreen()
            self.floaty.close()
        })
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
        floaty.items[0].title = "Rate & Review"
        floaty.items[1].title = "Share App"
//        floaty.items[2].title = "Contact Us"
        
        addWaveBackground(to :viewtransperent)
        //-----------------------------------
        if self.defaults.bool(forKey: "IsPrimeUser") {
          //  handlingdForPrimeIser()
        }
        
        if !(UIDevice.current.hasNotch) {
            self.WidthSound.constant = 36
            widthHouseImg.constant = 100
            imgVwWildAnimal.layer.cornerRadius = (widthHouseImg.constant)/2
            imgVwPetAnimal.layer.cornerRadius = (widthHouseImg.constant)/2
            imgVwBird.layer.cornerRadius = (widthHouseImg.constant)/2
            imgVwFlower.layer.cornerRadius = (widthHouseImg.constant)/2
            imgVwTest.layer.cornerRadius = (widthHouseImg.constant)/2
        }
        lblHouse.font = fontImageTitleLbl
        lblKitchen.font = fontImageTitleLbl
        lblGardeningTools.font = fontImageTitleLbl
        lblStationeryItems.font = fontImageTitleLbl
        lblTest.font = fontImageTitleLbl
        
        let loaderGif1 = UIImage.gifImageWithName("animated-clipart-house")
        let loaderGif2 = UIImage.gifImageWithName("animated-clipart-house")

        imgViewBottomGif1.image = loaderGif1
        imgViewBottomGif2.image = loaderGif2
//        imgViewBottomGif3.image = loaderGif

        
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
          let multipler = CGFloat(0.07)  //0.13
        
          let leftDrop:CGFloat = 0.4 + multipler
          let leftInflexionX: CGFloat = 0.4 + multipler
          let leftInflexionY: CGFloat = 0.47 + multipler

          let rightDrop: CGFloat = 0.3 +  multipler
          let rightInflexionX: CGFloat = 0.6  +  multipler
          let rightInflexionY: CGFloat = 0.22 + multipler

          let backView = UIView(frame: view.frame)
          backView.backgroundColor = .clear
          view.addSubview(backView)
          let backLayer = CAShapeLayer()
          let path = UIBezierPath()
          path.move(to: CGPoint(x: 0, y: 0))
          path.addLine(to: CGPoint(x:0, y: view.frame.height * leftDrop))
          path.addCurve(to: CGPoint(x:225, y: view.frame.height * rightDrop),
                        controlPoint1: CGPoint(x: view.frame.width * leftInflexionX, y: view.frame.height * leftInflexionY),
                        controlPoint2: CGPoint(x: view.frame.width * rightInflexionX, y: view.frame.height * rightInflexionY+30))
          path.addLine(to: CGPoint(x:225, y: 0))
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
            btnSound.setBackgroundImage(UIImage(named: "Sound-On_home.png"), for: .normal)
            player.play()
        } else {
            defaults.set(true, forKey: "PauseHomeSound")
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off_home.png"), for: .normal)
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
                btnSound.setBackgroundImage(UIImage(named: "Sound-Off_home.png"), for: .normal)
                player.stop()
            } else {
                btnSound.setBackgroundImage(UIImage(named: "Sound-On_home.png"), for: .normal)
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
//        let paymentCostVC = PaymentCostController(nibName: "PaymentCostController", bundle: nil)
//        self.navigationController?.pushViewController(paymentCostVC, animated: true)
    }
    
    func showSubscriptionDetailScreen() {
        paymentDetailVC?.view.removeFromSuperview()
//        let paymenSubscriptionVC = SubscriptionDetailsController(nibName: "SubscriptionDetailsController", bundle: nil)
//        self.navigationController?.pushViewController(paymenSubscriptionVC, animated: true)
    }

    func showPaymentScreen(){
        paymentDetailVC?.view.frame = self.view.bounds
        paymentDetailVC?.delegatePayementForParent = self
        self.view.addSubview(paymentDetailVC?.view ?? UIView())
    }
    
    func appstoreRateAndReview() {
        paymentDetailVC?.view.removeFromSuperview()
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

extension HomeViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
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
