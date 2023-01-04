public class SetController2 {

    public List<Account> accList{get;set;}
    public ApexPages.StandardSetController sco;
    public SetController2()
    {
        //accList=[select id,name,billingcity from Account ];
        //sco=new ApexPages.StandardSetController(accList);
        sco=new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,billingcity from Account LIMIT 2]));
    }
    
    public List<Account> getAccounts()
    {
        return sco.getRecords();
    }
}