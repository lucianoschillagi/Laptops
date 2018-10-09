//
//  ApiConstants.swift
//  GL_Challenge
//
//  Created by Luciano Schillagi on 08/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation

/* Abstract:
Almacena valores a usar en la api call.
*/

extension LaptopApiClient {
	
	//*****************************************************************
	// MARK: - Constants
	//*****************************************************************
	
	struct Constants {
		
		// MARK: API Endpoint
		static let EndPoint = "http://private-f0eea-mobilegllatam.apiary-mock.com/list"
	}
	
	//*****************************************************************
	// MARK: - JSON Response Keys
	//*****************************************************************
	
	struct JSONResponseKeys {
		
		// MARK: Laptop Keys
		static let Title = "title"
		static let Description = "description"
		static let ImageUrl = "image"
	}
	
}
