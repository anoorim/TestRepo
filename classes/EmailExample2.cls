public class EmailExample2 {
    
    public string subject{get;set;}
    public string toaddress{get;set;}
    public string ccaddress{get;set;}
    public string body{get;set;}
    public void show()
    {
        List<String> toaddresslist=new List<String>();
    	List<String> toccaddresslist=new List<String>();        
       	for(String str:toaddress.split(','))
        {
            toaddresslist.add(str);
        }
        for(String str1:ccaddress.split(','))
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
}