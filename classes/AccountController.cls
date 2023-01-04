public class AccountController {
   
    public List<Account> acc1 {set;get;}
    public List<Account> acc2 {set;get;}
    public List<Contact> con  {set;get;}
    public Set<Id> accId {set;get;}
   
    public void showAccount(){
        acc1 =  new List<Account>();
        acc2 = new List<Account>();
        con  = new List<Contact>();
        accId = new Set<Id>();
       
        acc1 = [Select Id,Name, (Select Id from contacts) from Account];
        for(Account ac:acc1){
            if(ac.contacts.size()>0){
                accId.add(ac.Id);
            }
        }
       
        acc2 = [Select Id,Name,Industry,(Select Id,lastname from contacts) from Account where id= :accId];
    }

}