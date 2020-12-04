public class OmniChannelRoutingController {
    
    /*
        Primary method to route records through Omni-Channel
    */
    public static void routeToPreferredAgents( List < sObject > listRecords, String strEntity ) {
    
        List < PendingServiceRouting > listPSRs = new List < PendingServiceRouting >();
        String strChannelId = getChannelId( strEntity );
    
        for ( sObject obj : listRecords )        
            listPSRs.add( createPendingServiceRouting( obj, strChannelId ) );
        
        if ( listPSRs.size() > 0 ) {
        
            insert listPSRs;
            
        }
                
    }
    
    /*
        Method to create Pending Service Routing record
    */
    static PendingServiceRouting createPendingServiceRouting( sObject obj, String strChannelId ) {
    
        PendingServiceRouting psrObj = new PendingServiceRouting(
            CapacityWeight = 1,
            IsReadyForRouting = true,
            RoutingModel = 'MostAvailable',
            RoutingPriority = 1,
            ServiceChannelId = strChannelId,
            WorkItemId = obj.Id,
            PushTimeout = 0,
            RoutingType = 'SkillsBased',
            PreferredUserId = (String) obj.get( 'Preferred_User__c' ),
            IsPreferredUserRequired = true
        );
        return psrObj;
        
    }
    
    
    
    /*
        Method to get the Channel Id based on the Entity
    */
    static String getChannelId( String strEntity ) {
    
        ServiceChannel channel = [ SELECT Id From ServiceChannel Where RelatedEntity =: strEntity ];
        return channel.Id;
        
    }
    
}