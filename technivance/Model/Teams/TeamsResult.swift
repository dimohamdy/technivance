//
//	TeamsResult.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TeamsResult : NSObject, NSCoding, Mappable{

	var count : Int?
	var teams : [Team]?


	class func newInstance(map: Map) -> Mappable?{
		return TeamsResult()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		count <- map["count"]
		teams <- map["teams"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? Int
         teams = aDecoder.decodeObject(forKey: "teams") as? [Team]

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
		if teams != nil{
			aCoder.encode(teams, forKey: "teams")
		}

	}

}
