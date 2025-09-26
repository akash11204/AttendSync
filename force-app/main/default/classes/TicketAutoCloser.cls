global class TicketAutoCloser implements Schedulable {
    global void execute(SchedulableContext ctx) {
        Date today = Date.today();

        List<Ticket__c> toClose = [
            SELECT Id
            FROM Ticket__c
            WHERE Status__c = 'Open'
              AND Event_Date__c < :today
        ];

        for (Ticket__c t : toClose) {
            t.Status__c = 'Completed';
        }

        if (!toClose.isEmpty()) {
            update toClose;
        }
    }
}