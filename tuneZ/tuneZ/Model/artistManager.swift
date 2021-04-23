//
//  artistManager.swift
//  tuneZ
//
//  Created by Himanshu Gupta on 21/04/21.
//

import Foundation

protocol artistManagerDelegate {
    func didUpdateArtist(artist:artistModel)
    func didFailWithError(error: Error)
    }

class artistManager{
    
    var delegate : artistManagerDelegate?
    let url = "https://itunes.apple.com/search?term="
    
    func fetchArtist(searchArtist:String){
        let urlstring = "\(url)\(searchArtist)&entity=song"
        performRequest(urlstring : urlstring)
    }
    
    func performRequest(urlstring : String){
        if let url = URL(string: urlstring){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                }
                
                if let safeData = data{
                    if let artist = self.parseJSON(ArtistData: safeData){
                        self.delegate?.didUpdateArtist(artist: artist)
                        
                    }
                }
            }
        
            task.resume()
        }
    }
    
    func parseJSON(ArtistData:Data) -> artistModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(artistData.self, from: ArtistData)
            //expects a decodable data type
            
            var songName = ["j"]
            songName[0] = decodedData.results[0].trackName
            var albumName = ["Dont know."]
            albumName[0] = decodedData.results[0].collectionName
            
            for i in 1..<decodedData.results.count-1{
                songName.append(decodedData.results[i].trackName)
                albumName.append(decodedData.results[i].collectionName)
            }
            
                
            let ArtistModel = artistModel(songName: songName, albumName: albumName)
                print(songName)
                
                return ArtistModel
        }catch{
            delegate?.didFailWithError(error : error)
            return nil
        }
      
    }
    
}


