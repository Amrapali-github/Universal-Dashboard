@isTest
public with sharing class UniversalDashboardTests {
    @TestSetup
    static void makeData(){
        StaticResource testData = [SELECT Id, Body
                                  FROM StaticResource 
                                  WHERE Name = 'UniversalDashboardTestData'
                                  LIMIT 1];
        String body = testData.Body.toString();
        system.debug('######JSON body: ' + body);
        List<Opportunity> testOpps = (List<Opportunity>)JSON.deserialize(body,List<Opportunity>.class);
        Insert testOpps;
    }

    @isTest
    public static void fetchOpportunitiesTest(){
        List<Opportunity> testResults = UniversalDashboardController.fetchOpportunities();
        system.AssertEquals(testResults.size(),3);
    }

    @isTest
    public static void getOpportunitiesWithCloseDateBeforeTodayTest(){
        List<Opportunity> testResults = UniversalDashboardController.getOpportunitiesWithCloseDateBeforeToday();
        system.AssertEquals(testResults.size(),2);
    }

    @isTest
    public static void getOppsClosingThisWeekTest(){
        List<Opportunity> testResults = UniversalDashboardController.getOppsClosingThisWeek();
        system.AssertEquals(testResults.size(),4);
    }

    @isTest
    public static void getOppsClosingThisWeekInProspectingTest(){
        List<Opportunity> testResults = UniversalDashboardController.getOppsClosingThisWeekInProspecting();
        system.AssertEquals(testResults.size(),2);
    }
}