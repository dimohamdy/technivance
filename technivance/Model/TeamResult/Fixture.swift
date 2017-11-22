//
//	Fixture.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class Fixture : NSObject, NSCoding, Mappable{

	var links : TeamLink?
	var awayTeamName : String?
	var date : String?
	var homeTeamName : String?
	var matchday : Int?
	var odds : AnyObject?
	var result : Result?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return Fixture()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		links <- map["_links"]
		awayTeamName <- map["awayTeamName"]
		date <- map["date"]
		homeTeamName <- map["homeTeamName"]
		matchday <- map["matchday"]
		odds <- map["odds"]
		result <- map["result"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         links = aDecoder.decodeObject(forKey: "_links") as? TeamLink
         awayTeamName = aDecoder.decodeObject(forKey: "awayTeamName") as? String
         date = aDecoder.decodeObject(forKey: "date") as? String
         homeTeamName = aDecoder.decodeObject(forKey: "homeTeamName") as? String
         matchday = aDecoder.decodeObject(forKey: "matchday") as? Int
         odds = aDecoder.decodeObject(forKey: "odds") as? AnyObject
         result = aDecoder.decodeObject(forKey: "result") as? Result
         status = aDecoder.decodeObject(forKey: "status") as? String

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
		if awayTeamName != nil{
			aCoder.encode(awayTeamName, forKey: "awayTeamName")
		}
		if date != nil{
			aCoder.encode(date, forKey: "date")
		}
		if homeTeamName != nil{
			aCoder.encode(homeTeamName, forKey: "homeTeamName")
		}
		if matchday != nil{
			aCoder.encode(matchday, forKey: "matchday")
		}
		if odds != nil{
			aCoder.encode(odds, forKey: "odds")
		}
		if result != nil{
			aCoder.encode(result, forKey: "result")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
