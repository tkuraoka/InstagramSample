//
//  TabBarController.swift
//  InstaSampleApp
//
//  Created by 倉岡隆志 on 2020/06/12.
//  Copyright © 2020 TakashiKuraoka. All rights reserved.
//

import UIKit
import Firebase

class TabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タブアイコンの色
        self.tabBar.tintColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        
        // タブバーの色
        self.tabBar.barTintColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)

        // UIBarControllerDelegateプロトコルのメソッドをこのクラスで処理する
        self.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // currentUserがnilならログインしていない
        if Auth.auth().currentUser == nil {
            // ログインしていないときの処理
            let loginViewController = storyboard?.instantiateViewController(identifier: "Login")
            self.present(loginViewController!, animated: true, completion: nil)
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is ImageSelectViewController {
            // ImageSelectViewControllerはタブ切り替えではなく、モーダル画面遷移する
            let imageSelectViewController = storyboard?.instantiateViewController(identifier: "ImageSelect")
            present(imageSelectViewController!, animated: true)
            return false
        } else {
            // その他のViewControllerは通常のタブ切り替えを実施
            return true
        }
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
