# Route the Work to the specific Agent using Omni-Channel in Salesforce?

Sample Code to call the method:
List < Case > listCases = [ SELECT Id, Preferred_User__c FROM Case WHERE Id = '5005w00001fqspyAAA' ];
OmniChannelRoutingController.routeToPreferredAgents( listCases, 'Case' );

For additional information, check the below link
https://www.infallibletechie.com/2020/12/how-to-route-work-to-specific-agent.html
