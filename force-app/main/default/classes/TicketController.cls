public with sharing class TicketController {
    @AuraEnabled(cacheable=true)
    public static List<Ticket__c> getTickets() {
        return [
            SELECT Id, Name, Status__c, Event__r.Name
            FROM Ticket__c
            WHERE Event_Date__c < :Date.today()
        ];
    }
}