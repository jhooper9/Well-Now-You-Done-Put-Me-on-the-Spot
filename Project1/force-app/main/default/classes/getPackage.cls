public class getPackage {
    
    public String TrackingID {get;set;}
    public Package__c pkg {get;set;}
    public Contact ct {get;set;}
    public Address__c addr {get;set;}
    
    public void find(){
    	
        List<Package__c> pkgs = new List<Package__c>();
        List<Inhabitant__c> inhs = new List<Inhabitant__c>();
        List<Contact> cts = new List<Contact>();
        List<Address__c> addrs = new List<Address__c>();
        
        try{
            pkgs = [SELECT Name, Status__c, Destination__c, Return__c FROM Package__c WHERE Name=:TrackingID WITH SECURITY_ENFORCED];
            pkg = pkgs[0];
            inhs = [SELECT Address__c, Contact__c FROM Inhabitant__c WHERE ID=:pkg.Destination__c];
            cts = [SELECT Name FROM Contact WHERE ID=:inhs[0].Contact__c];
            addrs = [SELECT Mailing_Address__c FROM Address__c WHERE ID=:inhs[0].Address__c];
            
            ct = cts[0];
            addr = addrs[0];
            
        }
        catch(exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'No package with that ID found.'));
        }
                
    }

}