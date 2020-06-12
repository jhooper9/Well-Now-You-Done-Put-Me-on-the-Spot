public with sharing class getPackage {
    
    public String TrackingID {get;set;}
    
    public PageReference find(){
    	List<Package__c> pkg = new List<Package__c>();
        
        try{
            pkg = [SELECT Name FROM Package__c WHERE Name=:TrackingID WITH SECURITY_ENFORCED];
            PageReference pg = new PageReference('/' + pkg[0].id);
            return pg;
        }
        catch(exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'No package with that ID found.'));
            return null;
        }
                
    }

}