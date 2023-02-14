//
//  SpaceNewsManager.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-16.
//



import Foundation


@MainActor class SpaceNew : ObservableObject { // @MainActor updating the ui and ensure that they run on the main thread
    @Published var news: [SpaceData] = []
    func getNews(){
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=20") else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Error", publishedAt: "Error")]
                }
                return
            }
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
              // if thats work go ahead
            DispatchQueue.main.async { // update the data
                print("successfully, Articles: \(spaceData.count)")
                self.news = spaceData
            }
        }.resume()
    }
}
