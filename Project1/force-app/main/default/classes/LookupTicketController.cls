public with sharing class LookupTicketController {
    public Case ticket {get;set;}
    public String caseSearch {get;set;}
    public String commentToAdd {get;set;}
    
    public LookupTicketController(ApexPages.StandardController sc){
        ticket = (Case)sc.getRecord();
        ticket.Description = '';
    }
    public PageReference find(){
        //System.debug(caseSearch);
        ticket=[SELECT Id,Description,Subject,TrackingID__c,Status, CaseNumber,
                CreatedDate,ClosedDate FROM Case WHERE CaseNumber=:caseSearch][0];
        caseSearch='';
        return Page.LookupTicket;
    }
    public void addComment(){
        if(commentToAdd!=''){
            String existingDescription = ticket.Description;
            //ticket.Description = existingDescription +
            if(ticket.Description!=null) ticket.Description = UserInfo.getFirstName()+': '+
                DateTime.now().format()+':\n'+
                commentToAdd+'\n\n'+ticket.Description;
            else ticket.Description = DateTime.now().format()+':\n'+ commentToAdd;
            UPDATE ticket;
            commentToAdd='';
        }
    }
}