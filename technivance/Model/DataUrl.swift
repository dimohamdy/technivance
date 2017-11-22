//
//	Fixture.swift
//
//	Create by Ahmed Tawfik on 22/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DataUrl : NSObject, NSCoding, Mappable{

	var href : String?


	class func newInstance(map: Map) -> Mappable?{
		return DataUrl()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		href <- map["href"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         href = aDecoder.decodeObject(forKey: "href") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if href != nil{
			aCoder.encode(href, forKey: "href")
		}

	}

}
