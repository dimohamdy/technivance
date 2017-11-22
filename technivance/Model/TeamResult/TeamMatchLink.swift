//
//	Link.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TeamMatchLink : NSObject, NSCoding, Mappable{

	var awayTeam : DataUrl?
	var competition : DataUrl?
	var homeTeam : DataUrl?
	var dataUrl : DataUrl?


	class func newInstance(map: Map) -> Mappable?{
		return TeamMatchLink()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		awayTeam <- map["awayTeam"]
		competition <- map["competition"]
		homeTeam <- map["homeTeam"]
		dataUrl <- map["self"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         awayTeam = aDecoder.decodeObject(forKey: "awayTeam") as? DataUrl
         competition = aDecoder.decodeObject(forKey: "competition") as? DataUrl
         homeTeam = aDecoder.decodeObject(forKey: "homeTeam") as? DataUrl
         dataUrl = aDecoder.decodeObject(forKey: "self") as? DataUrl

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if awayTeam != nil{
			aCoder.encode(awayTeam, forKey: "awayTeam")
		}
		if competition != nil{
			aCoder.encode(competition, forKey: "competition")
		}
		if homeTeam != nil{
			aCoder.encode(homeTeam, forKey: "homeTeam")
		}
		if dataUrl != nil{
			aCoder.encode(dataUrl, forKey: "self")
		}

	}

}
