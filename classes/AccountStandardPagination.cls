public class AccountStandardPagination {
    private Account ac1;
    
    public AccountStandardPagination(Apexpages.StandardSetController acc){
        this.ac1 = (Account)acc.getRecord();
    }
    
    public ApexPages.StandardSetController acc1{
        get{
            if(acc1==null){
                acc1 = new Apexpages.StandardSetController(
                    		Database.getQueryLocator([Select name from Account]));
           }
           return acc1;
        }
        set;
    }
    
    public List<Account> getacca1(){
        return (List<Account>) acc1.getRecords();
        
    }

}