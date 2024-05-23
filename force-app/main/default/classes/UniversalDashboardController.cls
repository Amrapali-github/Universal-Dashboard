public with sharing class UniversalDashboardController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> fetchOpportunities() {
        return [SELECT Id, Name, Amount FROM Opportunity WHERE Amount > 1000000];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesWithCloseDateBeforeToday() {
        return [SELECT Id, Name, CloseDate FROM Opportunity WHERE CloseDate < TODAY];
    }
    
    //Query all the opportunity closing this week  
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsClosingThisWeek() {
        List<Opportunity> oppClosingThisWeek = [SELECT Id ,
                                                        Name,
                                                        Amount,
                                                        CloseDate
                                                FROM Opportunity 
                                                WHERE CloseDate = THIS_WEEK];
        return oppClosingThisWeek;
    }

    //Query all the opportynity whoes closing this week but still in Prospect or earlier stage 
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsClosingThisWeekInProspecting() {
        List<Opportunity> oppClosingThisWeek = [SELECT Id ,
                                                        Name,
                                                        Amount,
                                                        CloseDate
                                                FROM Opportunity 
                                                WHERE CloseDate = THIS_WEEK                                                  
                                                AND (StageName != 'Closed Won' OR StageName != 'Close Lost') ];
        return oppClosingThisWeek;
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesWithBlankStartDate() {
        
        
        return [SELECT Id, Name, StageName, Expected_Start_Date__c 
                FROM Opportunity 
                WHERE Expected_Start_Date__c = NULL 
                AND  StageName = 'Negotiate' OR StageName = 'Closed Won' OR StageName = 'Closed Lost'];
    }
}
