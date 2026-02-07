import SwiftUI
import GoogleMaps

@main
struct _8App: App {
    init() {
        GMSServices.provideAPIKey(&quot;AIzaSyDLBvk6bWjyU2K96Fr-QBbob4uz0N3H6Rw&quot;)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
