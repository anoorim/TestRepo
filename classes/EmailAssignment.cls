public class EmailAssignment {
    
    public string toaddr{get;set;}
    public string ccaddr{get;set;}
    public string body{get;set;}
    public string msg{get;set;}
    public string subject{get;set;}
    public date enddate{get;set;}
    public boolean showmsg{get;set;}
    public boolean showsuccessmsg{get;set;}
    public integer CalculateDateDiff{get;set;}
    
    public EmailAssignment()
    {
        
        showmsg=false;
        showsuccessmsg=false;
    }
    
    public void calcdiff(){
        
        date datetoday=Date.today();
        CalculateDateDiff=datetoday.daysBetween(enddate);
    }
    public void show()
    {
        if(CalculateDateDiff<=2)
        {
            showmsg=false;
            sendmail();
            showsuccessmsg=true;
        }
        else{
            showmsg=true;
          
        }
    }
    public void sendmail()
    {
        
        List<String> toaddresslist=new List<String>();
        List<String> toccaddresslist=new List<String>();
        for(String str:toaddr.split(','))
        {
            toaddresslist.add(str);
        }
        for(String str1:ccaddr.split(','))
        {
            toccaddresslist.add(str1);
        }
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        string[] toAddress=new string[]{};
        string[] toCCAddress=new string[]{};
        msg.setToAddresses(toaddresslist);
        msg.setCcAddresses(toccaddresslist);
        msg.setBccAddresses(toccaddresslist);
        msg.setPlainTextBody(body);
        msg.setSubject(subject);
        messaging.sendEmail(new messaging.SingleEmailMessage[]{msg}); 
    }
    
    // public void saveobj()
    //{
    //  Object_A__c obj=new Object_A__c();
    //obj.enddate__c = enddate;
    //insert obj;
    //}
    
}