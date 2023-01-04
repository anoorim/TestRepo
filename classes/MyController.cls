public class MyController {

    Account account;

    public MyController(ApexPages.StandardController acc)
    {
        
    }
    public PageReference save() {
        update account;
        PageReference secondPage = Page.Test1;
        secondPage.setRedirect(true);//updates the url to the url of the second page
        secondPage.getParameters().put('id',account.id);//pass the id to the second page
        return secondPage; 
    }

    public String getName() {
        return 'MyController';
    }

    public Account getAccount() {
        if(account == null) 
            account = [select id, name, site from Account 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
        return account; 
    } 
}