import { LightningElement, wire } from 'lwc';
import getTickets from '@salesforce/apex/TicketController.getTickets';

export default class TicketViewer extends LightningElement {
  tickets;

  @wire(getTickets)
  wiredTickets({ error, data }) {
    if (data) {
      this.tickets = data;
    } else {
      this.tickets = null;
    }
  }
}

