public class ContactErrorTestClass {

    List<Contact> conList=new List<Contact>();
    public string firstname1{get;set;}
    public string lastname1{get;set;}
    public string firstname2{get;set;}
    
    public void createcontact(){
        
            Contact con1=new Contact(firstname=firstname1,lastname=lastname1);
            Contact con2=new Contact(firstname=firstname2);
            conList.add(con1);
            conList.add(con2);
        	insert conList;
        
    }
}