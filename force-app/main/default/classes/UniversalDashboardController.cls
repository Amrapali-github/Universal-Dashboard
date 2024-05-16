public with sharing class UniversalDashboardController {
    public UniversalDashboardController() {
        @AuraEnabled(cacheable=true)
        public static List<Opportunity> fetchOpportunities() {
            return [SELECT Id, Name, Amount FROM Opportunity WHERE Amount > 1000000];
        }


        @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesWithCloseDateBeforeToday() {
        return [SELECT Id, Name, CloseDate FROM Opportunity WHERE CloseDate < TODAY];
    }

        

            //Query all the opportunity closing this week 
            

            List<Opportunity> oppClosingThisWeek = [SELECT Id ,
                                                            Name,
                                                            Amount,
                                                            CloseDate
                                                    FROM Opportunity 
                                                    WHERE CloseDate = THIS_WEEK];


            //Query all the opportynity whoes closing this week but still in Prospect or earlier stage 

            List<Opportunity> oppClosingThisWeek = [SELECT Id ,
                                                            Name,
                                                            Amount,
                                                            CloseDate
                                                    FROM Opportunity 
                                                    WHERE CloseDate = THIS_WEEK                                                  
                                                    AND StageName != 'Closed Won' OR Stage != 'Close Lost' ];


            
        

       


    }
}