//
//  SceneDelegate.swift
//  CardWorkout-Programmatic
//
//  Created by Maggie Hillebrecht on 8/4/24.
//

/*
 new in iOS 13
 allows the app to have two instances of itself side by side
 */
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a new UIWindow instance
        window = UIWindow(windowScene: windowScene)
        
        // Create your initial view controller
        let initialViewController = CardSelectionViewController() // Replace with your initial view controller
        
        // Set the root view controller of the window
        window?.rootViewController = initialViewController
        
        // Make the window visible
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called when the scene is released by the system.
        // Release any resources associated with this scene.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, etc.
    }
}

