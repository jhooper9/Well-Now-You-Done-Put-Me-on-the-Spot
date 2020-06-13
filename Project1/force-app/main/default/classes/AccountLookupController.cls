public class AccountLookupController {

  

    public List<Account> acc { get; set; }

    public String name { get; set; }

    public String mailingState { get; set; }
    public id selected {get; set;}
	
    public id userid;
 
    public AccountLookupController()

    {

        acc = new List<Account>();
		userid = UserInfo.getUserId();
    }

 

    public PageReference searchAccounts()
    {
        sObject[][] templist = new sobject[][]{};
            
        templist.clear();
        acc.clear();
        
		System.debug(name);  
        if(name.length() < 3)
        {
        	return null;
        }
         templist = [FIND :name IN Name Fields RETURNING Account(id, Name, OwnerId, Industry, Website, Phone) ];
        
        for(integer i =0; i < templist.Size(); i++)
        {
			for(integer j = 0; j < templist[i].Size(); j++)
        	{
            	System.debug('within loop');
                
   				System.Debug(templist[i][j]);            
        	}            
            
        }
     
        
        For(integer i =0; i<templist[0].size(); i++)
        {
            if(templist[0][i] instanceof Account)
            {
                account temp = (Account)templist[0][i];
               if(temp.OwnerId == userid) 
               {
             acc.add(temp);  
               }
                //System.debug((Account)templist[0][i]);
            }
            
        }
          
		//System.debug(acc.size());
        return null;
    }


 Public pagereference Updateaccounts()
 {
     
     update acc;
     return null;
 }
    
    
    
    
}