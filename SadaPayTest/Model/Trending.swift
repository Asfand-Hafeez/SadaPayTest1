//
//  Trending.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 02/08/2022.
//

import Foundation

// MARK: - Trending Model APi Model
struct TrendingModel:Codable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [Item]
}

// MARK: - Item
struct Item :Codable{
    var id: Int
    var nodeId, name, fullName: String
    var owner: Owner
    var description: String
    var fork: Bool
    var url: String
    var forksUrl: String
    var gitUrl, sshUrl: String
    var cloneUrl: String
    var svnUrl: String
    var homepage: String
    var size, stargazersCount, watchersCount: Int
    var language: String?
    var hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    var hasPages: Bool
    var forksCount: Int
    var archived, disabled: Bool
    var openIssuesCount: Int
    var allowForking, isTemplate, webCommitSignoffRequired: Bool
    var topics: [String]
    var forks, openIssues, watchers: Int
    var defaultBranch: String
    var score: Int
}


// MARK: - Owner
struct Owner :Codable{
    var login: String
    var id: Int
    var nodeId: String
    var avatarUrl: String
    var gravatarId: String
    var url, htmlUrl, followersUrl: String
    var followingUrl, gistsUrl, starredUrl: String
    var subscriptionsUrl, organizationsUrl, reposUrl: String
    var type: String
    var siteAdmin: Bool
}
