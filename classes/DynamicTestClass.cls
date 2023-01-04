public class DynamicTestClass {
    
    public string text1{get;set;}
    public string text2{get;set;}
    public string text3{get;set;}
    public string text4{get;set;}
    public string field1{get;set;}
    public string field2{get;set;}
    public string field3{get;set;}
    
    public List<Account> acc{get;set;}
    public List<String> fields{get;set;}
    
    //public DynamicTestClass(apexpages.StandardController var){}
    
    public string str;
    
    public void getDetails()
    {
        acc= new List<Account>();
       	str='select '+text1+','+text2+','+text3+' from Account where billingcity LIKE \'%'+text4+'%\'';
        acc=Database.query(str);
        field1=text1;
        field2=text2;
        field3=text3;
        fields=new List<String>();
        fields.add(field1);
        fields.add(field2);
        fields.add(field3);
    }
}