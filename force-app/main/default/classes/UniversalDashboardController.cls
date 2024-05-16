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
    }
}