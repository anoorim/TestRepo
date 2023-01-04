public class ParameterTestClass {
    
    public id id1{get;set;}
    public string name1{get;set;}
    public Account acc{get;set;}
    public Contact cc{get;set;}
    public string oppname{get;set;}
    public string oppstage{get;set;}
    public date oppdate{get;set;}
    private ApexPages.StandardController cntct;
    
    public ParameterTestClass(Apexpages.StandardController cntct)
    {
        this.cntct=cntct;
        acc=new Account();
        //cc=new Contact();
        cc=(Contact)cntct.getRecord();
        id1=ApexPages.currentPage().getParameters().get('acc');
        name1=ApexPages.currentPage().getParameters().get('name');
        //acc=[select id,name,rating from Account where id=:id1];
        cc.AccountId=id1;
        
    }
    
    public PageReference save()
    { 
        cntct.save();
        //detailPage=cntct.save(); -- To display the contact detail page
        PageReference detailPage= new PageReference('/' +id1);
        Opportunity opp=new Opportunity();
        opp.name=oppname;
        opp.AccountId=id1;
        opp.CloseDate=Date.valueOf(oppdate);
        //opp.CloseDate=Date.newInstance(2019, 05, 20);
        opp.StageName=oppstage;
        insert opp;
        //OpportunityContactRole opprole=new OpportunityContactRole();
        //opprole.OpportunityId=opp.Id;
        //opprole.ContactId=cc.Id;
        //opprole.Role='System Administrator';
        //insert opprole;
        return detailPage;
    }
    
    
}