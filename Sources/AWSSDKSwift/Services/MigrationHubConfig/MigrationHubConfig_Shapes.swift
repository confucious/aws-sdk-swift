// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore

extension MigrationHubConfig {

    public struct CreateHomeRegionControlRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DryRun", required: false, type: .boolean), 
            AWSShapeMember(label: "HomeRegion", required: true, type: .string), 
            AWSShapeMember(label: "Target", required: true, type: .structure)
        ]

        /// Optional Boolean flag to indicate whether any effect should take place. It tests whether the caller has permission to make the call.
        public let dryRun: Bool?
        /// The name of the home region of the calling account.
        public let homeRegion: String
        /// The account for which this command sets up a home region control. The Target is always of type ACCOUNT.
        public let target: Target

        public init(dryRun: Bool? = nil, homeRegion: String, target: Target) {
            self.dryRun = dryRun
            self.homeRegion = homeRegion
            self.target = target
        }

        public func validate(name: String) throws {
            try validate(self.homeRegion, name:"homeRegion", parent: name, max: 50)
            try validate(self.homeRegion, name:"homeRegion", parent: name, min: 1)
            try validate(self.homeRegion, name:"homeRegion", parent: name, pattern: "^([a-z]+)-([a-z]+)-([0-9]+)$")
            try self.target.validate(name: "\(name).target")
        }

        private enum CodingKeys: String, CodingKey {
            case dryRun = "DryRun"
            case homeRegion = "HomeRegion"
            case target = "Target"
        }
    }

    public struct CreateHomeRegionControlResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "HomeRegionControl", required: false, type: .structure)
        ]

        /// This object is the HomeRegionControl object that's returned by a successful call to CreateHomeRegionControl.
        public let homeRegionControl: HomeRegionControl?

        public init(homeRegionControl: HomeRegionControl? = nil) {
            self.homeRegionControl = homeRegionControl
        }

        private enum CodingKeys: String, CodingKey {
            case homeRegionControl = "HomeRegionControl"
        }
    }

    public struct DescribeHomeRegionControlsRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ControlId", required: false, type: .string), 
            AWSShapeMember(label: "HomeRegion", required: false, type: .string), 
            AWSShapeMember(label: "MaxResults", required: false, type: .integer), 
            AWSShapeMember(label: "NextToken", required: false, type: .string), 
            AWSShapeMember(label: "Target", required: false, type: .structure)
        ]

        /// The ControlID is a unique identifier string of your HomeRegionControl object.
        public let controlId: String?
        /// The name of the home region you'd like to view.
        public let homeRegion: String?
        /// The maximum number of filtering results to display per page. 
        public let maxResults: Int?
        /// If a NextToken was returned by a previous call, more results are available. To retrieve the next page of results, make the call again using the returned token in NextToken.
        public let nextToken: String?
        /// The target parameter specifies the identifier to which the home region is applied, which is always of type ACCOUNT. It applies the home region to the current ACCOUNT.
        public let target: Target?

        public init(controlId: String? = nil, homeRegion: String? = nil, maxResults: Int? = nil, nextToken: String? = nil, target: Target? = nil) {
            self.controlId = controlId
            self.homeRegion = homeRegion
            self.maxResults = maxResults
            self.nextToken = nextToken
            self.target = target
        }

        public func validate(name: String) throws {
            try validate(self.controlId, name:"controlId", parent: name, max: 50)
            try validate(self.controlId, name:"controlId", parent: name, min: 1)
            try validate(self.controlId, name:"controlId", parent: name, pattern: "^hrc-[a-z0-9]{12}$")
            try validate(self.homeRegion, name:"homeRegion", parent: name, max: 50)
            try validate(self.homeRegion, name:"homeRegion", parent: name, min: 1)
            try validate(self.homeRegion, name:"homeRegion", parent: name, pattern: "^([a-z]+)-([a-z]+)-([0-9]+)$")
            try validate(self.maxResults, name:"maxResults", parent: name, max: 100)
            try validate(self.maxResults, name:"maxResults", parent: name, min: 1)
            try validate(self.nextToken, name:"nextToken", parent: name, max: 2048)
            try validate(self.nextToken, name:"nextToken", parent: name, min: 0)
            try validate(self.nextToken, name:"nextToken", parent: name, pattern: "^[a-zA-Z0-9\\/\\+\\=]{0,2048}$")
            try self.target?.validate(name: "\(name).target")
        }

        private enum CodingKeys: String, CodingKey {
            case controlId = "ControlId"
            case homeRegion = "HomeRegion"
            case maxResults = "MaxResults"
            case nextToken = "NextToken"
            case target = "Target"
        }
    }

    public struct DescribeHomeRegionControlsResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "HomeRegionControls", required: false, type: .list), 
            AWSShapeMember(label: "NextToken", required: false, type: .string)
        ]

        /// An array that contains your HomeRegionControl objects.
        public let homeRegionControls: [HomeRegionControl]?
        /// If a NextToken was returned by a previous call, more results are available. To retrieve the next page of results, make the call again using the returned token in NextToken.
        public let nextToken: String?

        public init(homeRegionControls: [HomeRegionControl]? = nil, nextToken: String? = nil) {
            self.homeRegionControls = homeRegionControls
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case homeRegionControls = "HomeRegionControls"
            case nextToken = "NextToken"
        }
    }

    public struct GetHomeRegionRequest: AWSShape {


        public init() {
        }

    }

    public struct GetHomeRegionResult: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "HomeRegion", required: false, type: .string)
        ]

        /// The name of the home region of the calling account.
        public let homeRegion: String?

        public init(homeRegion: String? = nil) {
            self.homeRegion = homeRegion
        }

        private enum CodingKeys: String, CodingKey {
            case homeRegion = "HomeRegion"
        }
    }

    public struct HomeRegionControl: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ControlId", required: false, type: .string), 
            AWSShapeMember(label: "HomeRegion", required: false, type: .string), 
            AWSShapeMember(label: "RequestedTime", required: false, type: .timestamp), 
            AWSShapeMember(label: "Target", required: false, type: .structure)
        ]

        /// A unique identifier that's generated for each home region control. It's always a string that begins with "hrc-" followed by 12 lowercase letters and numbers.
        public let controlId: String?
        /// The AWS Region that's been set as home region. For example, "us-west-2" or "eu-central-1" are valid home regions.
        public let homeRegion: String?
        /// A timestamp representing the time when the customer called CreateHomeregionControl and set the home region for the account.
        public let requestedTime: TimeStamp?
        /// The target parameter specifies the identifier to which the home region is applied, which is always an ACCOUNT. It applies the home region to the current ACCOUNT.
        public let target: Target?

        public init(controlId: String? = nil, homeRegion: String? = nil, requestedTime: TimeStamp? = nil, target: Target? = nil) {
            self.controlId = controlId
            self.homeRegion = homeRegion
            self.requestedTime = requestedTime
            self.target = target
        }

        private enum CodingKeys: String, CodingKey {
            case controlId = "ControlId"
            case homeRegion = "HomeRegion"
            case requestedTime = "RequestedTime"
            case target = "Target"
        }
    }

    public struct Target: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Id", required: false, type: .string), 
            AWSShapeMember(label: "Type", required: true, type: .enum)
        ]

        /// The TargetID is a 12-character identifier of the ACCOUNT for which the control was created. (This must be the current account.) 
        public let id: String?
        /// The target type is always an ACCOUNT.
        public let `type`: TargetType

        public init(id: String? = nil, type: TargetType) {
            self.id = id
            self.`type` = `type`
        }

        public func validate(name: String) throws {
            try validate(self.id, name:"id", parent: name, max: 12)
            try validate(self.id, name:"id", parent: name, min: 12)
            try validate(self.id, name:"id", parent: name, pattern: "^\\d{12}$")
        }

        private enum CodingKeys: String, CodingKey {
            case id = "Id"
            case `type` = "Type"
        }
    }

    public enum TargetType: String, CustomStringConvertible, Codable {
        case account = "ACCOUNT"
        public var description: String { return self.rawValue }
    }
}
