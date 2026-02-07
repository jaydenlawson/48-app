import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var searchText = &quot;&quot;
    
    var body: some View {
        VStack(spacing: 0) {
            MapUIView(viewModel: viewModel)
                .ignoresSafeArea()
            
            HStack {
                TextField(&quot;Search places near Sydney (e.g. coffee)...&quot;, 
                          text: $searchText, 
                          onCommit: {
                    viewModel.searchPlaces(query: searchText)
                })
                .textFieldStyle(.roundedBorder)
                
                Button(&quot;Clear&quot;) {
                    viewModel.clearMarkers()
                    searchText = &quot;&quot;
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(.regularMaterial)
        }
        .onAppear {
            // Map initializes to Sydney center
        }
    }
}

#Preview {
    ContentView()
}
