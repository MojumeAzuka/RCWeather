//  WeatherManager.swift
//  RCWeather
//
//  Created by Azuka Mojume on 05/06/2024

import Foundation

struct WeatherManager {
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?APPID=e352e421a90f3e008254c5b415134870&units=metric"
    //    weatherURL is a string for openweathermap.org's url
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        //        urlString is a string that is a concatenation of the openweathermap.org's url and the city's name that is entered into the textfield to make up a complete query
        performRequest(urlString: urlString)
        //        this calls the performRequest to check the weather
    }
    
    func performRequest (urlString: String) {
        if let url = URL(string: urlString){
            //            url is a URL, a value that identifies the location of a resource, such as an item on a remote server or the path to a local file. It is derived from converting a string (urlSt)
            let session = URLSession(configuration: .default)
            //            session is a URLSession, which is an object that coordinates a group of related, network data transfer tasks.
            
            //            let task = session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
            let task = session.dataTask(with: url) { data, response, error in
                /*task creates a task that retrieves the contents of the url, then calls a handler upon completion. dataTask is a method with two parameters. The first is of a url datatype and the second is meant to be a function but can be converted to a closure, a trailing closure*/
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                    //                    let dataString = String(data: safeData, encoding: .utf8)
                    //                    print(dataString)
                }
            }
            task.resume()
            //resume is used because tasks are started from a suspended state
        }
    }
    
    func parseJSON(weatherData: Data) {
        //the parseJSON function converts the JSON data into standard data types
        let decoder =  JSONDecoder()
        //decoder is an object that decodes instances of a data type from JSON objects. It is an instance of the JSONDecoder class
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
            //decode returns a value of the type you specify, decoded from a JSON object.
            //            its parameters are;
            //            type: The type of the value to decode from the supplied JSON object.
            //            data: The JSON object to decode. In this case its weatherData
           
            //             If a value within the JSON fails to decode, this method throws the corresponding error.
            print(decodedData.main.temp)
        }
        catch {
            print(error)
            //            If the data isn’t valid JSON, this method throws the DecodingError.dataCorrupted(_:) error.
        }
        
    }
}
