public class UpConPhonClass {
    
    public String accname{get;set;}
    public List<Contact> conList{get;set;}
    public List<Contact> conList1{get;set;}
    public List<Account> alist{get;set;}
    public String accphone{get;set;}
    public Boolean showphone{get;set;}
    
    public UpConPhonClass()
    {
        showphone=false;
    }
    public void showcon(){
        
        showphone=true;
        conList=[select id,name,phone from Contact where Account.name=:accname];
    }
    
    public void updatephone(){
        
        aList=[select id,name, phone from Account where name=:accname];
        for(Account acc:aList)
        {
            acc.phone=accphone;
            for(Contact con:conList)
            {
                con.Phone=accphone;
            }
        }
        
        update alist;
        update conList;
    }
}