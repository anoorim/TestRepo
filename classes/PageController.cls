public class PageController {

    public ApexPages.StandardSetController scon;
    
    public PageController(ApexPages.StandardSetController sc)
    {
        scon=new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,billingcity from Account order by name asc]));
        scon.setPageSize(10);
    }
    public List<Account> getAccounts()
    {
        return scon.getRecords();
    }
    
    public void previous()
    {
        scon.previous();
    }
    public void next()
    {
        scon.next();
    }
    public void last()
    {
        scon.last();
    }
}