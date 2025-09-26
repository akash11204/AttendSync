trigger AutoClosePastTickets on Ticket__c (before insert, before update) {
    Date today = Date.today();

    for (Ticket__c ticket : Trigger.new) {
        if (ticket.Event_Date__c != null && ticket.Event_Date__c < today && ticket.Status__c == 'Open') {
            ticket.Status__c = 'Completed';
        }
    }
}