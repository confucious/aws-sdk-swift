// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

@_exported import AWSSDKSwiftCore
import Foundation
import NIO

/**
 Amazon Detective is currently in preview. The Detective API can only be used by accounts that are admitted into the preview.  Detective uses machine learning and purpose-built visualizations to help you analyze and investigate security issues across your Amazon Web Services (AWS) workloads. Detective automatically extracts time-based events such as login attempts, API calls, and network traffic from AWS CloudTrail and Amazon Virtual Private Cloud (Amazon VPC) flow logs. It also extracts findings detected by Amazon GuardDuty. The Detective API primarily supports the creation and management of behavior graphs. A behavior graph contains the extracted data from a set of member accounts, and is created and managed by a master account. Every behavior graph is specific to a Region. You can only use the API to manage graphs that belong to the Region that is associated with the currently selected endpoint. A Detective master account can use the Detective API to do the following:   Enable and disable Detective. Enabling Detective creates a new behavior graph.   View the list of member accounts in a behavior graph.   Add member accounts to a behavior graph.   Remove member accounts from a behavior graph.   A member account can use the Detective API to do the following:   View the list of behavior graphs that they are invited to.   Accept an invitation to contribute to a behavior graph.   Decline an invitation to contribute to a behavior graph.   Remove their account from a behavior graph.   All API actions are logged as CloudTrail events. See Logging Detective API Calls with CloudTrail.
*/
public struct Detective {

    public let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, sessionToken: String? = nil, region: AWSSDKSwiftCore.Region? = nil, endpoint: String? = nil, middlewares: [AWSServiceMiddleware] = [], eventLoopGroupProvider: AWSClient.EventLoopGroupProvider = .useAWSClientShared) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            sessionToken: sessionToken,
            region: region,
            service: "api.detective",
            signingName: "detective",
            serviceProtocol: ServiceProtocol(type: .restjson, version: ServiceProtocol.Version(major: 1, minor: 1)),
            apiVersion: "2018-10-26",
            endpoint: endpoint,
            middlewares: middlewares,
            possibleErrorTypes: [DetectiveErrorType.self],
            eventLoopGroupProvider: eventLoopGroupProvider
        )
    }

    ///  Amazon Detective is currently in preview. Accepts an invitation for the member account to contribute data to a behavior graph. This operation can only be called by an invited member account.  The request provides the ARN of behavior graph. The member account status in the graph must be INVITED.
    @discardableResult public func acceptInvitation(_ input: AcceptInvitationRequest) -> Future<Void> {
        return client.send(operation: "AcceptInvitation", path: "/invitation", httpMethod: "PUT", input: input)
    }

    ///  Amazon Detective is currently in preview. Creates a new behavior graph for the calling account, and sets that account as the master account. This operation is called by the account that is enabling Detective. The operation also enables Detective for the calling account in the currently selected Region. It returns the ARN of the new behavior graph.  CreateGraph triggers a process to create the corresponding data tables for the new behavior graph. An account can only be the master account for one behavior graph within a Region. If the same account calls CreateGraph with the same master account, it always returns the same behavior graph ARN. It does not create a new behavior graph.
    public func createGraph() -> Future<CreateGraphResponse> {
        return client.send(operation: "CreateGraph", path: "/graph", httpMethod: "POST")
    }

    ///  Amazon Detective is currently in preview. Sends a request to invite the specified AWS accounts to be member accounts in the behavior graph. This operation can only be called by the master account for a behavior graph.   CreateMembers verifies the accounts and then sends invitations to the verified accounts. The request provides the behavior graph ARN and the list of accounts to invite. The response separates the requested accounts into two lists:   The accounts that CreateMembers was able to start the verification for. This list includes member accounts that are being verified, that have passed verification and are being sent an invitation, and that have failed verification.   The accounts that CreateMembers was unable to process. This list includes accounts that were already invited to be member accounts in the behavior graph.  
    public func createMembers(_ input: CreateMembersRequest) -> Future<CreateMembersResponse> {
        return client.send(operation: "CreateMembers", path: "/graph/members", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Disables the specified behavior graph and queues it to be deleted. This operation removes the graph from each member account's list of behavior graphs.  DeleteGraph can only be called by the master account for a behavior graph.
    @discardableResult public func deleteGraph(_ input: DeleteGraphRequest) -> Future<Void> {
        return client.send(operation: "DeleteGraph", path: "/graph/removal", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Deletes one or more member accounts from the master account behavior graph. This operation can only be called by a Detective master account. That account cannot use DeleteMembers to delete their own account from the behavior graph. To disable a behavior graph, the master account uses the DeleteGraph API method.
    public func deleteMembers(_ input: DeleteMembersRequest) -> Future<DeleteMembersResponse> {
        return client.send(operation: "DeleteMembers", path: "/graph/members/removal", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Removes the member account from the specified behavior graph. This operation can only be called by a member account that has the ENABLED status.
    @discardableResult public func disassociateMembership(_ input: DisassociateMembershipRequest) -> Future<Void> {
        return client.send(operation: "DisassociateMembership", path: "/membership/removal", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Returns the membership details for specified member accounts for a behavior graph.
    public func getMembers(_ input: GetMembersRequest) -> Future<GetMembersResponse> {
        return client.send(operation: "GetMembers", path: "/graph/members/get", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Returns the list of behavior graphs that the calling account is a master of. This operation can only be called by a master account. Because an account can currently only be the master of one behavior graph within a Region, the results always contain a single graph.
    public func listGraphs(_ input: ListGraphsRequest) -> Future<ListGraphsResponse> {
        return client.send(operation: "ListGraphs", path: "/graphs/list", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Retrieves the list of open and accepted behavior graph invitations for the member account. This operation can only be called by a member account. Open invitations are invitations that the member account has not responded to. The results do not include behavior graphs for which the member account declined the invitation. The results also do not include behavior graphs that the member account resigned from or was removed from.
    public func listInvitations(_ input: ListInvitationsRequest) -> Future<ListInvitationsResponse> {
        return client.send(operation: "ListInvitations", path: "/invitations/list", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Retrieves the list of member accounts for a behavior graph. Does not return member accounts that were removed from the behavior graph.
    public func listMembers(_ input: ListMembersRequest) -> Future<ListMembersResponse> {
        return client.send(operation: "ListMembers", path: "/graph/members/list", httpMethod: "POST", input: input)
    }

    ///  Amazon Detective is currently in preview. Rejects an invitation to contribute the account data to a behavior graph. This operation must be called by a member account that has the INVITED status.
    @discardableResult public func rejectInvitation(_ input: RejectInvitationRequest) -> Future<Void> {
        return client.send(operation: "RejectInvitation", path: "/invitation/removal", httpMethod: "POST", input: input)
    }
}
