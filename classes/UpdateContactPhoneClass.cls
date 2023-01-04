public class UpdateContactPhoneClass {
    
    public List<Contact> conList{get;set;} 
    public List<Contact> conList1{get;set;}
    public List<Account> accList{get;set;}
    public string aphone{get;set;}
    
    public string accname{get;set;}
    public boolean showphone{get;set;}
    public boolean showtable{get;set;}
    
    public UpdateContactPhoneClass(){
        
        showtable=false;
        showphone=false;
        
    }
    public void contactDisplay(){
        
        showtable=true;
        showphone=true;
        aphone=[select phone from Account where name=:accname].phone;
        conList=[select id,name,phone,Account.phone from Contact where Account.name=:accname];
        
    }
    
    public void updatephone(){
        
        accList=[select name,phone from account where account.name=:accname];
        For(Account acc:accList)
        {    
            acc.Phone=aphone;
            conList1=[select phone from Contact where AccountId=:acc.id];
            For(Contact con:conList)
            {
                con.phone=acc.phone;
            }
            
        }
        
        update conList;
        update accList;
        
    }
    
}