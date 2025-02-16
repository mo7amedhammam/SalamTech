//
//  SalamTechApp.swift
//  SalamTech
//
//  Created by wecancity agency on 3/29/22.
//

import SwiftUI
import GoogleMaps
let APIKey = "AIzaSyAy8wLUdHfHVmzlWLNPVF96SO0GY1gP4Po"
var language = LocalizationService.shared.language

@main
struct SalamTakApp: App {
//    @StateObject var environments = EnvironmentsVM()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("languageKey") // the key you stored language in
    var language = LocalizationService.shared.language

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                    .environmentObject(environments)
            }
            .navigationViewStyle(.stack)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate    {
    
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         @EnvironmentObject var locationManager: LocationManager1
         return true
     }
 }

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
                UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
#endif
