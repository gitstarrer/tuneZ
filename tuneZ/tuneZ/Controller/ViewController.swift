//
//  ViewController.swift
//  tuneZ
//
//  Created by Himanshu Gupta on 21/04/21.
//

import UIKit


class ViewController: UIViewController{
 
   
    @IBOutlet weak var resultLabel: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    var ArtistManager = artistManager()
    var songList = ["No results yet"]
    var albumList = [""]
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.becomeFirstResponder()
        ArtistManager.delegate = self
        searchField.delegate = self
        
        tableView.dataSource = self
        
       tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}



//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate{
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchField.resignFirstResponder()
        if let text = searchField.text{
            let newText = text.replacingOccurrences(of: " ", with: "+")
            searchField.text = newText
        }
        
        searchField.endEditing(true)
        tableView.reloadData()
    }
    
    //for the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = searchField.text{
            let newText = text.replacingOccurrences(of: " ", with: "+")
            searchField.text = newText
        }
        
        textField.endEditing(true) //to dismiss the keyboard
        tableView.reloadData()
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Search for an artist! Come on!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let artist = searchField.text{
            ArtistManager.fetchArtist(searchArtist: artist)
        }
        tableView.reloadData()
    }
    

}

//MARK: - ArtistManagerDelegate

extension ViewController : artistManagerDelegate{
    func didUpdateArtist(artist: artistModel) {
        DispatchQueue.main.async {
            self.songList = artist.songName
            self.albumList = artist.albumName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
//MARK: - TableView DataSource Methods

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.cellLabel?.text = songList[indexPath.row]
        cell.detailTextLabel?.text = albumList[indexPath.row]
        
        return cell
    }
    
    
}


   




