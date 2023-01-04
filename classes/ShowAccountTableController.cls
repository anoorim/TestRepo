public class ShowAccountTableController {
    
    public List<Account> aList{get;set;}       
    public boolean show{get;set;}
    public String description{get;set;}
   
    
    public ShowAccountTableController()
    {
        description='Show Table';
        show=false;
 
    }
    
    public void showhidemethod()
    {
        if(description=='Show Table')
        {
            showTable();
        }
        else
        {
            hideTable();
        }
    }
    public void showTable()
    {
        alist=new List<Account>();
        Account acc= new Account(Name='test',phone='1234',Rating='Hot');
        Account acc1= new Account(Name='test1',phone='1234',Rating='Cold');
        Account acc2= new Account(Name='test2',phone='1234',Rating='Warm');
        Account acc3= new Account(Name='test3',phone='1234',Rating='Hot');
        alist.add(acc);
        alist.add(acc1);
        alist.add(acc2);
        alist.add(acc3);
        show=true;
        description='Hide Table';
    }
    public void hideTable()
    {
        show=false;
        description='Show Table';
        
    }
}