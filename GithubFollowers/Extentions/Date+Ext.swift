//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 8/5/21.
//

import UIKit


extension UIViewController {
    
    func getDateWithoutTime(string: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: string) {
            dateFormatter.dateFormat = "MMM, yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
