import Foundation
import GoogleMaps
import CoreLocation

class MapViewModel: ObservableObject {
    @Published var markers: [GMSMarker] = []
    
    private let apiKey = &quot;AIzaSyDLBvk6bWjyU2K96Fr-QBbob4uz0N3H6Rw&quot;  // Same as in App.swift, but for HTTP
    
    private let sydneyCoord = &quot;-33.8688,151.2093&quot;
    private let searchRadius = 10000  // 10km
    
    func searchPlaces(query: String) {
        guard !query.isEmpty else { return }
        
        let keyword = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? &quot;&quot;
        let urlString = &quot;https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(sydneyCoord)&amp;radius=\(searchRadius)&amp;keyword=\(keyword)&amp;min_rating=4.8&amp;key=\(apiKey)&quot;
        
        guard let url = URL(string: urlString) else {
            print(&quot;Invalid URL&quot;)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil else {
                print(&quot;Search error: \(error?.localizedDescription ?? &quot;Unknown&quot;)&quot;)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let results = json[&quot;results&quot;] as? [[String: Any]] {
                    
                    var newMarkers: [GMSMarker] = []
                    
                    for placeDict in results {
                        guard let name = placeDict[&quot;name&quot;] as? String,
                              let geometry = placeDict[&quot;geometry&quot;] as? [String: Any],
                              let location = geometry[&quot;location&quot;] as? [String: Any],
                              let lat = location[&quot;lat&quot;] as? Double,
                              let lng = location[&quot;lng&quot;] as? Double,
                              let rating = placeDict[&quot;rating&quot;] as? Double else { continue }
                        
                        // Already filtered by API, but double-check
                        if rating &gt;= 4.8 {
                            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat, longitude: lng))
                            marker.title = name
                            marker.snippet = String(format: &quot;%.1f rating&quot;, rating)
                            marker.icon = GMSMarker.markerImage(with: UIColor.systemYellow)
                            newMarkers.append(marker)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.markers = newMarkers
                    }
                }
            } catch {
                print(&quot;JSON error: \(error)&quot;)
            }
        }.resume()
    }
    
    func clearMarkers() {
        markers.removeAll()
    }
}
