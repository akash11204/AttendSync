@isTest
public class AutoClosePastTicketTest {
    @isTest
    static void testAutoClose() {
        Ticket__c pastTicket = new Ticket__c();
        pastTicket.Status__c = 'Open';
        pastTicket.Event_Date__c = Date.today().addDays(-10);
        // Add any required fields here if needed

        insert pastTicket;

        Test.startTest();
        Test.stopTest();

        Ticket__c result = [SELECT Status__c FROM Ticket__c WHERE Id = :pastTicket.Id];
        System.assertEquals('Completed', result.Status__c);
    }
}