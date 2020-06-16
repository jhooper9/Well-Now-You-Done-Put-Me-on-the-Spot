public with sharing class LookupTicketController {
    public Case ticket {get;set;}
    public Id caseId {get;set;}
    public String commentToAdd {get;set;}
    
    public LookupTicketController(ApexPages.StandardController sc){
        ticket = (Case)sc.getRecord();
        ticket.Description = '';
    }
    public PageReference find(){
        ticket=[SELECT Id,Description,Subject,TrackingID__c,Status,
                CreatedDate,ClosedDate FROM Case WHERE Id=:caseId][0];
        return Page.LookupTicket;
    }
    public void addComment(){
        if(commentToAdd!=''){
            String existingDescription = ticket.Description;
            //ticket.Description = existingDescription +
            if(ticket.Description!=null) ticket.Description = DateTime.now().format()+':\n'+
                commentToAdd+'\n\n'+ticket.Description;
            else ticket.Description = DateTime.now().format()+':\n'+ commentToAdd;
            UPDATE ticket;
            commentToAdd='';
        }
    }
}