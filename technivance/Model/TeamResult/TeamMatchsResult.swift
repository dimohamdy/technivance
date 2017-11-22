//
//	TeamMatchsResult.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TeamMatchsResult : NSObject, NSCoding, Mappable{

	var count : Int?
	var fixtures : [Fixture]?
	var season : String?


	class func newInstance(map: Map) -> Mappable?{
		return TeamMatchsResult()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		count <- map["count"]
		fixtures <- map["fixtures"]
		season <- map["season"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? Int
         fixtures = aDecoder.decodeObject(forKey: "fixtures") as? [Fixture]
         season = aDecoder.decodeObject(forKey: "season") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if fixtures != nil{
			aCoder.encode(fixtures, forKey: "fixtures")
		}
		if season != nil{
			aCoder.encode(season, forKey: "season")
		}

	}

}
