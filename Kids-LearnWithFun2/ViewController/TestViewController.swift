//
//  TestViewController.swift
//  Kids-LearnWithFun2
//
//  Created by sheetal shinde on 24/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TestViewController: UIViewController,PayementForParentProtocol {
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var imgVwTest1: UIImageView!
    @IBOutlet weak var imgVwTest2: UIImageView!
    @IBOutlet weak var imgVwTest3: UIImageView!
    @IBOutlet weak var imgVwTest4: UIImageView!
    @IBOutlet weak var imgVwQuestion: UIImageView!
    @IBOutlet weak var btnNoAds: UIButton!
    @IBOutlet weak var imgViewLock2: UIImageView!
    @IBOutlet weak var imgViewLock3: UIImageView!
    @IBOutlet weak var imgViewLock4: UIImageView!
    @IBOutlet weak var lblTestI: UILabel!
    @IBOutlet weak var lblTestII: UILabel!
    @IBOutlet weak var lblTestIII: UILabel!
    @IBOutlet weak var lblTestIV: UILabel!


    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var paymentDetailVC : PaymentDetailViewController?
    var bannerView: GADBannerView!
    let defaults = UserDefaults.standard
//    var fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 24)
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognImgVwTest1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest1.addGestureRecognizer(tapGestureRecognImgVwTest1)
        imgVwTest1.tag = 1

        let tapGestureRecognImgVwTest2 = UITapGestureRecognizer(
            target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest2.addGestureRecognizer(tapGestureRecognImgVwTest2)
        imgVwTest2.tag = 2

        let tapGestureRecognImgVwTest3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest3.addGestureRecognizer(tapGestureRecognImgVwTest3)
        imgVwTest3.tag = 3


        let tapGestureRecognImgVwTest4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest4.addGestureRecognizer(tapGestureRecognImgVwTest4)
        imgVwTest4.tag = 4
        
        if UIScreen.main.bounds.size.height < 700.0 {
            imgVwQuestion.isHidden = true
        }
        if !(defaults.bool(forKey:"IsPrimeUser")) {
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            addBannerViewToView(bannerView)
            bannerView.adUnitID = CommanArray.Banner_AdUnitId
            bannerView.rootViewController = self
            bannerView.delegate = self
            if Reachability.isConnectedToNetwork() {
                DispatchQueue.main.async {
                    self.bannerView.load(GADRequest())
                }
            } else {
                let alert = UIAlertController(title: "", message: "No Internet Connection.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                    if self.timer == nil {
                        self.timer = Timer.scheduledTimer(timeInterval: CommanArray.timerForAds, target: self, selector: #selector(self.alarmToLoadBannerAds), userInfo: nil, repeats: true)
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            if UIScreen.main.bounds.height > 1100 {
                let fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 42)
                lblTestI.font = fontImageTitleLbl
                lblTestII.font = fontImageTitleLbl
                lblTestIII.font = fontImageTitleLbl
                lblTestIV.font = fontImageTitleLbl
            }
        }
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !defaults.bool(forKey:"IsPrimeUser") {
                if bannerView != nil {
                    if timer == nil {
                        if Reachability.isConnectedToNetwork() {
                            DispatchQueue.main.async {
                                self.bannerView.load(GADRequest())
                            }
                        } else {
                            let alert = UIAlertController(title: "", message: "No Internet Connection.", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                                if self.timer == nil {
                                    self.timer = Timer.scheduledTimer(timeInterval: CommanArray.timerForAds, target: self, selector: #selector(self.alarmToLoadBannerAds), userInfo: nil, repeats: true)
                                }
                            }))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if defaults.bool(forKey:"IsPrimeUser") {
            if let _ = btnNoAds {
                self.btnNoAds.isHidden = true
                if bannerView != nil {
                    bannerView.removeFromSuperview()
                }
            }
        } else {
            if let _ = btnNoAds {
                self.btnNoAds.isHidden = false
            }
        }
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let setTestSolveVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestSolveViewController") as! TestSolveViewController
        if tapGestureRecognizer.view?.tag == 1 {
            let solveTestArray = [[
                      CommanArray.houseHoldThingsNameArray[21]+"-"+"0",
                      CommanArray.houseHoldThingsNameArray[22]+"-"+"0",
                      CommanArray.houseHoldThingsNameArray[0]+"-"+"1",
                      CommanArray.houseHoldThingsNameArray[7]+"-"+"0"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[3]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[1]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[18]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[16]+"-"+"0"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[2]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[0]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[24]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[10]+"-"+"0"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[12]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[17]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[15]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[3]+"-"+"1"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[8]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[4]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[7]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[14]+"-"+"0"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[16]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[1]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[5]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[19]+"-"+"0"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[24]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[6]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[13]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[10]+"-"+"0"
                  ],
                  [
                       CommanArray.houseHoldThingsNameArray[23]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[4]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[7]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[21]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[3]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[14]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[5]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[8]+"-"+"1"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[17]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[9]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[7]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[13]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[20]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[10]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[11]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[21]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[11]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[18]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[0]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[22]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[1]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[20]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[12]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[19]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[2]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[13]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[5]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[4]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[14]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[23]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[3]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[7]+"-"+"0"
                   ],
                   [
                       CommanArray.houseHoldThingsNameArray[0]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[2]+"-"+"0",
                       CommanArray.houseHoldThingsNameArray[15]+"-"+"1",
                       CommanArray.houseHoldThingsNameArray[9]+"-"+"0"
                   ],
                   [
                        CommanArray.houseHoldThingsNameArray[16]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[2]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[6]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[21]+"-"+"0"
                   ],
                   [
                        CommanArray.houseHoldThingsNameArray[23]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[8]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[5]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[17]+"-"+"1"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[13]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[18]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[22]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[7]+"-"+"0"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[19]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[1]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[11]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[24]+"-"+"0"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[3]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[12]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[20]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[9]+"-"+"0"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[10]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[19]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[0]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[21]+"-"+"1"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[3]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[22]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[8]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[17]+"-"+"0"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[20]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[6]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[23]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[18]+"-"+"0"
                    ],
                    [
                        CommanArray.houseHoldThingsNameArray[24]+"-"+"1",
                        CommanArray.houseHoldThingsNameArray[0]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[4]+"-"+"0",
                        CommanArray.houseHoldThingsNameArray[14]+"-"+"0"
                    ]
            ]
            setTestSolveVC.showOptionsArray = solveTestArray
            setTestSolveVC.getImageNameArray = CommanArray.houseHoldThingsNameArray
            self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
        else if tapGestureRecognizer.view?.tag == 2 {
                let solveTestArray = [[
                    CommanArray.kitchenUtensilsNameArray[16]+"-"+"0",
                    CommanArray.kitchenUtensilsNameArray[10]+"-"+"0",
                    CommanArray.kitchenUtensilsNameArray[0]+"-"+"1",
                    CommanArray.kitchenUtensilsNameArray[18]+"-"+"0"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[3]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[1]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[6]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[16]+"-"+"0"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[2]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[9]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[7]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[10]+"-"+"0"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[12]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[17]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[15]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[3]+"-"+"1"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[8]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[4]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[18]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[14]+"-"+"0"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[16]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[1]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[5]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[19]+"-"+"0"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[9]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[6]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[13]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[10]+"-"+"0"
                ],
                [
                     CommanArray.kitchenUtensilsNameArray[11]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[4]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[7]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[0]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[3]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[14]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[5]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[8]+"-"+"1"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[6]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[9]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[1]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[13]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[15]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[10]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[11]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[17]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[11]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[18]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[0]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[6]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[1]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[0]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[12]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[19]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[2]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[13]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[5]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[4]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[14]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[18]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[3]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[7]+"-"+"0"
                 ],
                 [
                     CommanArray.kitchenUtensilsNameArray[0]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[19]+"-"+"0",
                     CommanArray.kitchenUtensilsNameArray[15]+"-"+"1",
                     CommanArray.kitchenUtensilsNameArray[9]+"-"+"0"
                 ],
                 [
                      CommanArray.kitchenUtensilsNameArray[16]+"-"+"1",
                      CommanArray.kitchenUtensilsNameArray[1]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[6]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[4]+"-"+"0"
                 ],
                 [
                      CommanArray.kitchenUtensilsNameArray[12]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[8]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[5]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[17]+"-"+"1"
                  ],
                  [
                      CommanArray.kitchenUtensilsNameArray[13]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[18]+"-"+"1",
                      CommanArray.kitchenUtensilsNameArray[2]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[7]+"-"+"0"
                  ],
                  [
                      CommanArray.kitchenUtensilsNameArray[19]+"-"+"1",
                      CommanArray.kitchenUtensilsNameArray[1]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[11]+"-"+"0",
                      CommanArray.kitchenUtensilsNameArray[0]+"-"+"0"
                  ]
                ]
                setTestSolveVC.showOptionsArray = solveTestArray
                setTestSolveVC.getImageNameArray = CommanArray.kitchenUtensilsNameArray
                self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
        else if tapGestureRecognizer.view?.tag == 3 {
                let solveTestArray = [
                    [
                       CommanArray.gardeningNameArray[2]+"-"+"0",
                       CommanArray.gardeningNameArray[10]+"-"+"0",
                       CommanArray.gardeningNameArray[0]+"-"+"1",
                       CommanArray.gardeningNameArray[11]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[8]+"-"+"0",
                       CommanArray.gardeningNameArray[1]+"-"+"1",
                       CommanArray.gardeningNameArray[5]+"-"+"0",
                       CommanArray.gardeningNameArray[9]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[2]+"-"+"1",
                       CommanArray.gardeningNameArray[12]+"-"+"0",
                       CommanArray.gardeningNameArray[7]+"-"+"0",
                       CommanArray.gardeningNameArray[10]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[9]+"-"+"0",
                       CommanArray.gardeningNameArray[6]+"-"+"0",
                       CommanArray.gardeningNameArray[5]+"-"+"0",
                       CommanArray.gardeningNameArray[3]+"-"+"1"
                    ],
                    [
                       CommanArray.gardeningNameArray[8]+"-"+"0",
                       CommanArray.gardeningNameArray[4]+"-"+"1",
                       CommanArray.gardeningNameArray[7]+"-"+"0",
                       CommanArray.gardeningNameArray[11]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[3]+"-"+"0",
                       CommanArray.gardeningNameArray[12]+"-"+"0",
                       CommanArray.gardeningNameArray[5]+"-"+"1",
                       CommanArray.gardeningNameArray[6]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[0]+"-"+"0",
                       CommanArray.gardeningNameArray[6]+"-"+"1",
                       CommanArray.gardeningNameArray[1]+"-"+"0",
                       CommanArray.gardeningNameArray[2]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[11]+"-"+"0",
                       CommanArray.gardeningNameArray[4]+"-"+"0",
                       CommanArray.gardeningNameArray[7]+"-"+"1",
                       CommanArray.gardeningNameArray[9]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[3]+"-"+"0",
                       CommanArray.gardeningNameArray[1]+"-"+"0",
                       CommanArray.gardeningNameArray[5]+"-"+"0",
                       CommanArray.gardeningNameArray[8]+"-"+"1"
                    ],
                    [
                       CommanArray.gardeningNameArray[0]+"-"+"0",
                       CommanArray.gardeningNameArray[9]+"-"+"1",
                       CommanArray.gardeningNameArray[4]+"-"+"0",
                       CommanArray.gardeningNameArray[12]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[3]+"-"+"0",
                       CommanArray.gardeningNameArray[10]+"-"+"1",
                       CommanArray.gardeningNameArray[2]+"-"+"0",
                       CommanArray.gardeningNameArray[6]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[11]+"-"+"1",
                       CommanArray.gardeningNameArray[4]+"-"+"0",
                       CommanArray.gardeningNameArray[0]+"-"+"0",
                       CommanArray.gardeningNameArray[10]+"-"+"0"
                    ],
                    [
                       CommanArray.gardeningNameArray[1]+"-"+"0",
                       CommanArray.gardeningNameArray[8]+"-"+"0",
                       CommanArray.gardeningNameArray[12]+"-"+"1",
                       CommanArray.gardeningNameArray[7]+"-"+"0"
                    ]
                ]
                setTestSolveVC.showOptionsArray = solveTestArray
                setTestSolveVC.getImageNameArray = CommanArray.gardeningNameArray
                self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
        else if tapGestureRecognizer.view?.tag == 4 {
            let solveTestArray = [[
                CommanArray.schoolNameArray[16]+"-"+"0",
                CommanArray.schoolNameArray[10]+"-"+"0",
                CommanArray.schoolNameArray[0]+"-"+"1",
                CommanArray.schoolNameArray[18]+"-"+"0"
            ],
            [
                 CommanArray.schoolNameArray[3]+"-"+"0",
                 CommanArray.schoolNameArray[1]+"-"+"1",
                 CommanArray.schoolNameArray[19]+"-"+"0",
                 CommanArray.schoolNameArray[16]+"-"+"0"
            ],
            [
                 CommanArray.schoolNameArray[2]+"-"+"1",
                 CommanArray.schoolNameArray[9]+"-"+"0",
                 CommanArray.schoolNameArray[7]+"-"+"0",
                 CommanArray.schoolNameArray[10]+"-"+"0"
            ],
            [
                 CommanArray.schoolNameArray[12]+"-"+"0",
                 CommanArray.schoolNameArray[17]+"-"+"0",
                 CommanArray.schoolNameArray[15]+"-"+"0",
                 CommanArray.schoolNameArray[3]+"-"+"1"
            ],
            [
                 CommanArray.schoolNameArray[8]+"-"+"0",
                 CommanArray.schoolNameArray[4]+"-"+"1",
                 CommanArray.schoolNameArray[18]+"-"+"0",
                 CommanArray.schoolNameArray[14]+"-"+"0"
            ],
            [
                 CommanArray.schoolNameArray[16]+"-"+"0",
                 CommanArray.schoolNameArray[1]+"-"+"0",
                 CommanArray.schoolNameArray[5]+"-"+"1",
                 CommanArray.schoolNameArray[19]+"-"+"0"
            ],
            [
                 CommanArray.schoolNameArray[9]+"-"+"0",
                 CommanArray.schoolNameArray[6]+"-"+"1",
                 CommanArray.schoolNameArray[13]+"-"+"0",
                 CommanArray.schoolNameArray[10]+"-"+"0"
            ],
            [
                 CommanArray.schoolNameArray[11]+"-"+"0",
                 CommanArray.schoolNameArray[4]+"-"+"0",
                 CommanArray.schoolNameArray[7]+"-"+"1",
                 CommanArray.schoolNameArray[0]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[3]+"-"+"0",
                 CommanArray.schoolNameArray[14]+"-"+"0",
                 CommanArray.schoolNameArray[5]+"-"+"0",
                 CommanArray.schoolNameArray[8]+"-"+"1"
             ],
             [
                 CommanArray.schoolNameArray[6]+"-"+"0",
                 CommanArray.schoolNameArray[9]+"-"+"1",
                 CommanArray.schoolNameArray[1]+"-"+"0",
                 CommanArray.schoolNameArray[13]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[15]+"-"+"0",
                 CommanArray.schoolNameArray[10]+"-"+"1",
                 CommanArray.schoolNameArray[11]+"-"+"0",
                 CommanArray.schoolNameArray[17]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[11]+"-"+"1",
                 CommanArray.schoolNameArray[18]+"-"+"0",
                 CommanArray.schoolNameArray[0]+"-"+"0",
                 CommanArray.schoolNameArray[6]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[1]+"-"+"0",
                 CommanArray.schoolNameArray[0]+"-"+"0",
                 CommanArray.schoolNameArray[12]+"-"+"1",
                 CommanArray.schoolNameArray[19]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[2]+"-"+"0",
                 CommanArray.schoolNameArray[13]+"-"+"1",
                 CommanArray.schoolNameArray[5]+"-"+"0",
                 CommanArray.schoolNameArray[4]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[14]+"-"+"1",
                 CommanArray.schoolNameArray[18]+"-"+"0",
                 CommanArray.schoolNameArray[3]+"-"+"0",
                 CommanArray.schoolNameArray[7]+"-"+"0"
             ],
             [
                 CommanArray.schoolNameArray[0]+"-"+"0",
                 CommanArray.schoolNameArray[11]+"-"+"0",
                 CommanArray.schoolNameArray[15]+"-"+"1",
                 CommanArray.schoolNameArray[9]+"-"+"0"
             ],
             [
                  CommanArray.schoolNameArray[16]+"-"+"1",
                  CommanArray.schoolNameArray[1]+"-"+"0",
                  CommanArray.schoolNameArray[6]+"-"+"0",
                  CommanArray.schoolNameArray[4]+"-"+"0"
             ],
             [
                  CommanArray.schoolNameArray[12]+"-"+"0",
                  CommanArray.schoolNameArray[8]+"-"+"0",
                  CommanArray.schoolNameArray[5]+"-"+"0",
                  CommanArray.schoolNameArray[17]+"-"+"1"
              ],
              [
                  CommanArray.schoolNameArray[13]+"-"+"0",
                  CommanArray.schoolNameArray[18]+"-"+"1",
                  CommanArray.schoolNameArray[2]+"-"+"0",
                  CommanArray.schoolNameArray[7]+"-"+"0"
              ],
              [
                  CommanArray.schoolNameArray[19]+"-"+"1",
                  CommanArray.schoolNameArray[1]+"-"+"0",
                  CommanArray.schoolNameArray[11]+"-"+"0",
                  CommanArray.schoolNameArray[0]+"-"+"0"
              ]
           ]
                setTestSolveVC.showOptionsArray = solveTestArray
                setTestSolveVC.getImageNameArray = CommanArray.schoolNameArray
                self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
    }
    // MARK: - User defined Functions
     
     @objc func alarmToLoadBannerAds(){
         print("Inside alarmToLoadBannerAds")
         if Reachability.isConnectedToNetwork() {
             if bannerView != nil {
                 print("Inside Load bannerView")
                DispatchQueue.main.async {
                    self.bannerView.load(GADRequest())
                }
             }
         }
     }

     //Start Payment flow
     @IBAction func funcNoAds(_ sender: Any) {
         showPaymentScreen()
     }
     func stopTimer() {
         print("Inside stopTimer")
         if timer != nil {
             timer?.invalidate()
             timer = nil
         }
     }

     //Delegate method implementation
     func showPaymentCostScreen() {
         paymentDetailVC?.view.removeFromSuperview()
         let PaymentCostVC = PaymentCostController(nibName: "PaymentCostController", bundle: nil)
         self.navigationController?.pushViewController(PaymentCostVC, animated: true)
     }
     func showSubscriptionDetailScreen() {
     }

     func showPaymentScreen(){
         paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
         paymentDetailVC?.view.frame = self.view.bounds
         paymentDetailVC?.delegatePayementForParent = self
         self.view.addSubview(paymentDetailVC?.view ?? UIView())
     }
     
     func appstoreRateAndReview() {
     }
     
     func shareApp() {
         
     }

     @IBAction func funcGoToTestHome(_ sender: Any) {
         stopTimer()
         navigationController?.popViewController(animated: true)
     }
}
extension TestViewController: GADBannerViewDelegate {
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
        if #available(iOS 11.0, *) {
          // In iOS 11, we need to constrain the view to the safe area.
          positionBannerViewFullWidthAtBottomOfSafeArea(bannerView)
        }
        else {
          // In lower iOS versions, safe area is not available so we use
          // bottom layout guide and view edges.
          positionBannerViewFullWidthAtBottomOfView(bannerView)
        }
     }

    func positionBannerViewFullWidthAtBottomOfSafeArea(_ bannerView: UIView) {
      // Position the banner. Stick it to the bottom of the Safe Area.
      // Make it constrained to the edges of the safe area.
      let guide = view.safeAreaLayoutGuide
      NSLayoutConstraint.activate([
        guide.leftAnchor.constraint(equalTo: bannerView.leftAnchor),
        guide.rightAnchor.constraint(equalTo: bannerView.rightAnchor),
        guide.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
      ])
    }

    func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView) {
      view.addConstraint(NSLayoutConstraint(item: bannerView,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: 0))
      view.addConstraint(NSLayoutConstraint(item: bannerView,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: 0))
      view.addConstraint(NSLayoutConstraint(item: bannerView,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: bottomLayoutGuide,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: 0))
    }

    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: CommanArray.timerForAds, target: self, selector: #selector(self.alarmToLoadBannerAds), userInfo: nil, repeats: true)
        }

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
