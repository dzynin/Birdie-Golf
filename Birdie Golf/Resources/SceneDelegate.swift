//
//  SceneDelegate.swift
//  Birdie Golf
//
//  Created by Scott Cox on 7/27/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        window?.overrideUserInterfaceStyle = .light
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if (UserDefaults.standard.string(forKey: "activeRoundId") != nil) {
            let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
            let playViewController = storyboard.instantiateViewController(withIdentifier: "TabBarMain")
            window?.rootViewController = playViewController
        } else if UserDefaults.standard.string(forKey: "email") != nil {
            let storyboard = UIStoryboard(name: "Pre-game", bundle: nil)
            let preGameViewController =
            storyboard.instantiateViewController(withIdentifier: "PregameView")
            window?.rootViewController = preGameViewController
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signInViewController =
            storyboard.instantiateViewController(withIdentifier: "CreateAcctID")
            window?.rootViewController = signInViewController
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func changeRootViewController(viewController: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.9, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
        
    }
    
    
}
// This extension gives radius functionality on the attributes inspector for the storyboard.
@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue

              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
}
