//
//  swift-data-model.swift
//  json2swift
//
//  Created by Joshua Smith on 10/14/16.
//  Copyright © 2016 iJoshSmith. All rights reserved.
//

import Foundation

public struct SwiftStruct {
    public let name: String
    public let properties: [SwiftProperty]
    public let initializer: SwiftInitializer
    public let failableInitializer: SwiftFailableInitializer
    public let nestedStructs: [SwiftStruct]
    public init(name: String, properties: [SwiftProperty], initializer: SwiftInitializer, failableInitializer: SwiftFailableInitializer, nestedStructs: [SwiftStruct]) {
        self.name = name
        self.properties = properties
        self.initializer = initializer
        self.failableInitializer = failableInitializer
        self.nestedStructs = nestedStructs
    }
}

public struct SwiftProperty {
    let name: String
    let type: SwiftType
}

public struct SwiftType {
    let name: String
    let isOptional: Bool
}

public struct SwiftInitializer {
    public let parameters: [SwiftParameter]
    public init(parameters: [SwiftParameter]) {
        self.parameters = parameters
    }
}

public struct SwiftParameter {
    let name: String
    let type: SwiftType
}

public struct SwiftFailableInitializer {
    public let requiredTransformations: [TransformationFromJSON]
    public let optionalTransformations: [TransformationFromJSON]
    public init(requiredTransformations: [TransformationFromJSON], optionalTransformations: [TransformationFromJSON]) {
        self.requiredTransformations = requiredTransformations
        self.optionalTransformations = optionalTransformations
    }
}

public enum TransformationFromJSON {
    case toCustomStruct(       attributeName: String, propertyName: String, type: SwiftStruct)
    case toPrimitiveValue(     attributeName: String, propertyName: String, type: SwiftPrimitiveValueType)
    case toCustomStructArray(  attributeName: String, propertyName: String, elementType: SwiftStruct,             hasOptionalElements: Bool)
    case toPrimitiveValueArray(attributeName: String, propertyName: String, elementType: SwiftPrimitiveValueType, hasOptionalElements: Bool)
}

public enum SwiftPrimitiveValueType {
    case int
    case double
    case date(format: String)
    case url
    case string
    case bool
    case any
    case emptyArray
}
