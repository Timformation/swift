//
//  PeopleService.swift
//  PlayGround
//
//  Created by Timothy Sirchuk on 5/24/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import Foundation

protocol PeopleServiceDelegate:class {
    func didFinishLoading(_ data:Data?, response:URLResponse?, error: NSError?) -> Void;
}

class PeopleService
{
    var delegate: PeopleServiceDelegate?;
    func loadMyPeeps()
    {
        let session = URLSession(configuration: URLSessionConfiguration.default);
        
        let url = URL(string: "https://cis-playground.azurewebsites.net/api/1.0/people");
        
        var request = URLRequest(url:url!);
        request.httpMethod = "GET";
        request.setValue("application/json", forHTTPHeaderField: "Accept");
        
        
        //the following lines of code are on a background thread (because dataTask is used). So, addition code is needed to see the action on main thread.
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            self.delegate?.didFinishLoading(data, response: response, error: error as? NSError)
        }
        
        task.resume();
    }
}
