public class SetController1 {
    
    public ApexPages.StandardSetController scon{
        get{
            
            if(scon==null)
            {
                scon=new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,billingcity from Account]));
            }
            return scon;
        }
        set;
    }
    
    public List<Account> getAccounts()
    {
        return (List<Account>)scon.getRecords();
    }
    
}