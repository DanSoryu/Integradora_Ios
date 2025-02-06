//
//  SceneDelegate.swift
//  Integradora_Ios
//
//  Created by mac on 04/02/25.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow window to the provided UIWindowScene scene.
        if let windowScene = scene as? UIWindowScene {
            // Si no tenemos una window configurada, creamos una nueva.
            if window == nil {
                let window = UIWindow(windowScene: windowScene)
                let storyboard = UIStoryboard(name: "Formulario_Monitores", bundle: nil)
                if let nuevoVC = storyboard.instantiateInitialViewController() {
                    window.rootViewController = nuevoVC
                    self.window = window
                    window.makeKeyAndVisible()
                }
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
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
    }
}
