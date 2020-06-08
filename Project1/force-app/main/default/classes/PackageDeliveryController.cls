public class PackageDeliveryController {
    public String filterChoice {get;set;}
    public List<SelectOption> possibleStates {get;set;}
    public packageDeliveryController(){
        filterChoice = 'Shipping';
        possibleStates = new List<SelectOption>();
        possibleStates.add(new SelectOption('Processing','Processing'));
        possibleStates.add(new SelectOption('Shipping','Shipping'));
        possibleStates.add(new SelectOption('Delivered','Delivered'));
        possibleStates.add(new SelectOption('Missing','Missing'));
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