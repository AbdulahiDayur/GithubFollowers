//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/15/21.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please try again. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received  from the server was invalid. Please try again"
    case unableToFavorite = "There was an error favoriting this user. Please try again!"
}
