//
//  Laptop.swift
//  GL_Challenge
//
//  Created by Luciano Schillagi on 08/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un objeto preparado para almacenar los datos recibidos de la laptop.
*/

struct Laptop {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// datos laptop
	let title: String? // 'title'
	let description: String? // 'description'
	let imageUrl: String? // 'image'

	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'Laptop' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		title = dictionary[LaptopApiClient.JSONResponseKeys.Title] as? String
		description = dictionary[LaptopApiClient.JSONResponseKeys.Description] as? String
		imageUrl = dictionary[LaptopApiClient.JSONResponseKeys.ImageUrl] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	// task: devolver un array de objetos 'Laptop'
	static func laptopFromResults(_ laptopResults: [[String:AnyObject]]) -> [Laptop] {
		
		var laptopArray = [Laptop]()
		
		// itera a través del array de diccionarios, cada ´Laptop´ es un diccionario
		for result in laptopResults {
			laptopArray.append(Laptop(dictionary: result))
		}
		
		return laptopArray
	}
	
} // end class
