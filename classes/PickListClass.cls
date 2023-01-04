public class PickListClass {
    
    public String newcity{get;set;}
    public string newpicklistvalue{get;set;}
    public List<Account> accity{get;set;}
    public  List<SelectOption> options{get;set;}
    
    public List<SelectOption> getcityname()
    {
        
        //Create a list of select option type
        List<SelectOption> options = new List<SelectOption>();
        
        options.add(new SelectOption('None','None'));
        
        //FieldDescription=SObjectName.FieldName.getDescribe()
        Schema.DescribeFieldResult fieldResult=Account.city__c.getDescribe();
        
        //Get all picklist value in a list of scheme.picklistentry type
        List<Schema.PicklistEntry> ple=fieldResult.getPickListValues();
        
        //Add each value in the list of selectoption
        for(schema.PicklistEntry p:ple)
        {
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
        
    }
    
    public void savecity()
    {
        Account accnew=new Account(name='A1',city__c=newcity);
        insert accnew;
        newcity=NULL;
    }
}