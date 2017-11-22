//
//	Link.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TeamLink : NSObject, NSCoding, Mappable{

	var fixtures : DataUrl?
	var players : DataUrl?
	var dataUrl : DataUrl?


	class func newInstance(map: Map) -> Mappable?{
		return TeamLink()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		fixtures <- map["fixtures"]
		players <- map["players"]
		dataUrl <- map["self"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         fixtures = aDecoder.decodeObject(forKey: "fixtures") as? DataUrl
         players = aDecoder.decodeObject(forKey: "players") as? DataUrl
         dataUrl = aDecoder.decodeObject(forKey: "self") as? DataUrl

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if fixtures != nil{
			aCoder.encode(fixtures, forKey: "fixtures")
		}
		if players != nil{
			aCoder.encode(players, forKey: "players")
		}
		if self != nil{
			aCoder.encode(dataUrl, forKey: "self")
		}

	}

}
