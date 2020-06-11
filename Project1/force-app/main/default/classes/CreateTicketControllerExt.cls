public class CreateTicketControllerExt {
	
    public Case thisCase = new Case();
    
    public CreateTicketControllerExt(ApexPages.StandardController acon){
        this.thisCase = (Case)acon.getRecord();
    }
    
    public PageReference saveCase(){
        this.thisCase.Origin = 'Web';
        insert this.thisCase;
        
        PageReference pRef = new PageReference('/' + this.thisCase.id);
    	return pRef;
    }
    
}