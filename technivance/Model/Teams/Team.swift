//
//	Team.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Team : NSObject, NSCoding, Mappable{

	var links : TeamLink?
	var code : AnyObject?
	var crestUrl : String?
	var name : String?
	var shortName : String?
	var squadMarketValue : AnyObject?


	class func newInstance(map: Map) -> Mappable?{
		return Team()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		links <- map["_links"]
		code <- map["code"]
		crestUrl <- map["crestUrl"]
		name <- map["name"]
		shortName <- map["shortName"]
		squadMarketValue <- map["squadMarketValue"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         links = aDecoder.decodeObject(forKey: "_links") as? TeamLink
         code = aDecoder.decodeObject(forKey: "code") as? AnyObject
         crestUrl = aDecoder.decodeObject(forKey: "crestUrl") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         shortName = aDecoder.decodeObject(forKey: "shortName") as? String
         squadMarketValue = aDecoder.decodeObject(forKey: "squadMarketValue") as? AnyObject

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
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if crestUrl != nil{
			aCoder.encode(crestUrl, forKey: "crestUrl")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if shortName != nil{
			aCoder.encode(shortName, forKey: "shortName")
		}
		if squadMarketValue != nil{
			aCoder.encode(squadMarketValue, forKey: "squadMarketValue")
		}

	}

}
