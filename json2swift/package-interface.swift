import Foundation

public func generateSwiftCodeBasedOnJSON(data: Data, rootTypeName: String) -> String? {

    let jsonObject: Any
    do    { jsonObject = try JSONSerialization.jsonObject(with: data, options: []) }
    catch { return nil }

    let jsonSchema: JSONElementSchema
    if      let jsonElement = jsonObject as? JSONElement   { jsonSchema = JSONElementSchema.inferred(from: jsonElement, named: rootTypeName) }
    else if let jsonArray   = jsonObject as? [JSONElement] { jsonSchema = JSONElementSchema.inferred(from: jsonArray,   named: rootTypeName) }
    else { return nil}

    let swiftStruct = SwiftStruct.create(from: jsonSchema)
    let swiftCode = SwiftCodeGenerator.generateCode(for: swiftStruct)
    return swiftCode
}
