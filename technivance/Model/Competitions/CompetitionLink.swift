//
//	Link.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class CompetitionLink : NSObject, NSCoding, Mappable{

	var fixtures : DataUrl?
	var leagueTable : DataUrl?
	var dataUrl : DataUrl?
	var teams : DataUrl?


	class func newInstance(map: Map) -> Mappable?{
		return CompetitionLink()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		fixtures <- map["fixtures"]
		leagueTable <- map["leagueTable"]
		dataUrl <- map["self"]
		teams <- map["teams"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         fixtures = aDecoder.decodeObject(forKey: "fixtures") as? DataUrl
         leagueTable = aDecoder.decodeObject(forKey: "leagueTable") as? DataUrl
         dataUrl = aDecoder.decodeObject(forKey: "self") as? DataUrl
         teams = aDecoder.decodeObject(forKey: "teams") as? DataUrl

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
		if leagueTable != nil{
			aCoder.encode(leagueTable, forKey: "leagueTable")
		}
		if self != nil{
			aCoder.encode(dataUrl, forKey: "self")
		}
		if teams != nil{
			aCoder.encode(teams, forKey: "teams")
		}

	}

}
