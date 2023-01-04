public class SOSLExampleClass {

    public List<List<Account>> acc{get;set;}
    public List<Account> acn{get;set;}
    public String str{get;set;}
    
    public void getData(){
        
        acc=[FIND :str IN NAME FIELDS returning Account(id,name,billingcity)];
        acn=acc[0];
    }
}