//
//	CompetitionsResult.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Competition : NSObject, NSCoding, Mappable{

	var links : CompetitionLink?
	var caption : String?
	var currentMatchday : Int?
	var id : Int?
	var lastUpdated : String?
	var league : String?
	var numberOfGames : Int?
	var numberOfMatchdays : Int?
	var numberOfTeams : Int?
	var year : String?


	class func newInstance(map: Map) -> Mappable?{
		return Competition()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		links <- map["_links"]
		caption <- map["caption"]
		currentMatchday <- map["currentMatchday"]
		id <- map["id"]
		lastUpdated <- map["lastUpdated"]
		league <- map["league"]
		numberOfGames <- map["numberOfGames"]
		numberOfMatchdays <- map["numberOfMatchdays"]
		numberOfTeams <- map["numberOfTeams"]
		year <- map["year"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         links = aDecoder.decodeObject(forKey: "_links") as? CompetitionLink
         caption = aDecoder.decodeObject(forKey: "caption") as? String
         currentMatchday = aDecoder.decodeObject(forKey: "currentMatchday") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         lastUpdated = aDecoder.decodeObject(forKey: "lastUpdated") as? String
         league = aDecoder.decodeObject(forKey: "league") as? String
         numberOfGames = aDecoder.decodeObject(forKey: "numberOfGames") as? Int
         numberOfMatchdays = aDecoder.decodeObject(forKey: "numberOfMatchdays") as? Int
         numberOfTeams = aDecoder.decodeObject(forKey: "numberOfTeams") as? Int
         year = aDecoder.decodeObject(forKey: "year") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if links != nil{
			aCoder.encode(links, forKey: "_links")
		}
		if caption != nil{
			aCoder.encode(caption, forKey: "caption")
		}
		if currentMatchday != nil{
			aCoder.encode(currentMatchday, forKey: "currentMatchday")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastUpdated != nil{
			aCoder.encode(lastUpdated, forKey: "lastUpdated")
		}
		if league != nil{
			aCoder.encode(league, forKey: "league")
		}
		if numberOfGames != nil{
			aCoder.encode(numberOfGames, forKey: "numberOfGames")
		}
		if numberOfMatchdays != nil{
			aCoder.encode(numberOfMatchdays, forKey: "numberOfMatchdays")
		}
		if numberOfTeams != nil{
			aCoder.encode(numberOfTeams, forKey: "numberOfTeams")
		}
		if year != nil{
			aCoder.encode(year, forKey: "year")
		}

	}

}
