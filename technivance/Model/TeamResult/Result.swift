//
//	Result.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Result : NSObject, NSCoding, Mappable{

	var goalsAwayTeam : AnyObject?
	var goalsHomeTeam : AnyObject?


	class func newInstance(map: Map) -> Mappable?{
		return Result()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		goalsAwayTeam <- map["goalsAwayTeam"]
		goalsHomeTeam <- map["goalsHomeTeam"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         goalsAwayTeam = aDecoder.decodeObject(forKey: "goalsAwayTeam") as? AnyObject
         goalsHomeTeam = aDecoder.decodeObject(forKey: "goalsHomeTeam") as? AnyObject

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if goalsAwayTeam != nil{
			aCoder.encode(goalsAwayTeam, forKey: "goalsAwayTeam")
		}
		if goalsHomeTeam != nil{
			aCoder.encode(goalsHomeTeam, forKey: "goalsHomeTeam")
		}

	}

}