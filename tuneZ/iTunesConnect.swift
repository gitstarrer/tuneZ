////
////  iTunesConnect.swift
////  tuneZ
////
////  Created by Himanshu Gupta on 21/04/21.
////
//
//import UIKit
////func performRequest (urlString : String){
////    if let url = URL(string: urlString){
////
////        let session = URLSession(configuration: .default)
////
////        let task = session.dataTask(with: url) { (data, response, error) in
////            if error != nil{
////                self.delegate?.didFailWithError(error : error!)
////                return
////            }
////
////            if let safeData = data{
////                if let weather = self.parseJSON(WeatherData: safeData){
////                    self.delegate?.didUpdateWeather(weather : weather)
////                }
////            }
////        }
////        task.resume()
////    }
////}
//
//class iTunesConnect: NSObject {
//    func getAlbumForString(searchString:String){
//        let url = NSURL(string: "https://itunes.apple.com/search?term=frozen&media=music")
//
//        let session = URLSession(configuration: .default)
//
//        let task = session.dataTask(with: url) { (data, response, error) in
//            <#code#>
//        }
//       // let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: {_,_,_ in ((data:NSData?, response:URLResponse?, error:NSError?) -> Void){
//            if error == null{
//                let iTunesDict = JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            }
//        }
//        })
//    }
//}
//
//
