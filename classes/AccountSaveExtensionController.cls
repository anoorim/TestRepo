public class AccountSaveExtensionController {
    
    public Account acc{get;set;}
    public List<Account> accList{get;set;}
    //public Boolean accpb {get;set;}
    
    public AccountSaveExtensionController(ApexPages.StandardController sc){
        this.acc = (Account)sc.getRecord();
    }
    
    public PageReference getAccounts(){
        accList = [select id,name,Rating from Account order by createdDate Limit 10 ];
        return null;
    }
}