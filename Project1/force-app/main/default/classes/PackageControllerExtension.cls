public class PackageControllerExtension {
    private Package__c pkg;
    public String filterChoice {get;set;}
    public List<SelectOption> possibleStates {get;set;}
    public PackageControllerExtension(ApexPages.StandardController stdController){
        this.pkg = (Package__c)stdController.getRecord();
        filterChoice = 'Shipping';
        possibleStates = new List<SelectOption>{new SelectOption('Processing','Processing'),
            									new SelectOption('Shipping','Shipping'),
            									new SelectOption('Delivered','Delivered'),
            									new SelectOption('Missing','Missing')};
    }
    public List<Package__c> getPackages(){
        List<Package__c> results = [SELECT Status__c, Name FROM Package__c WHERE Status__c=:filterChoice];
        //List<Package__c> results = Database.query('SELECT Status__c, Name FROM Package__c '+
        //                                          'WHERE Status__c = '+ filterChoice);
        return results;
    }
    
    public void showShipping(){
        this.filterChoice = 'Shipping';
    }
    public void showDelivered(){
        this.filterChoice = 'Delivered';
    }
    public void showMissing(){
        this.filterChoice = 'Missing';
    }
    public void showProcessing(){
        this.filterChoice = 'Processing';
    }
}