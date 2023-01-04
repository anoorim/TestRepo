public class SOQLAssignment1Class {
    
    
    public List<Account> acct{get;set;}
    public string getcity{get;set;}
    public boolean show{get;set;}
    public boolean showmsg{get;set;}
    public boolean savemsg{get;set;}
    public boolean showwarnmsg{get;set;}
    public string value{get;set;}
    public integer cnt{get;set;}
    
    
    public SOQLAssignment1Class(){
        
        show=false;
        value='Show Details';
        showmsg=false;//no records fetched
        showwarnmsg=false;//pls enter the city
        savemsg=false;// msg after record update
        
    }
    
    
    public void getAccounts()
    {
       
        acct= [select name,billingcity from Account where BillingCity =:getcity];
        
        
        cnt=[select count() from Account where BillingCity=:getcity];
        
        if(value=='Show Details')
        {
            showTable();
        }
        else
        {
            hideTable();
        }
        
    }
    public void showTable(){
        
        savemsg=false;
        IF(getcity!='')
        {
            If(cnt==0)
            {
                showmsg=true;
                show=false;
                showwarnmsg=false;
                
            }
            else
            {
                show=true;
                value='Hide Details';
                showmsg=false;
                showwarnmsg=false;
                
            }
        }
        else
        {
            showwarnmsg=true;
            showmsg=false;
            
        }
        
    }
    public void hideTable(){
        
        show=false;
        value='Show Details';
        savemsg=false;
    }
    
    public void save()
    {
        update acct;
        savemsg=true;
        show=false;
        value='Show Details';
    }
    
}