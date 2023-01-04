public class OppController {

    public List<Opportunity> opp{get;set;}
    public List<Opportunity> opp1{get;set;}
    public List<Task> tsk{get;set;}
    public Set<id> oppid{get;set;}
    public Set<id> tskid{get;set;}
    
    public PageReference displayopp()
    {
        Getdisplayopp1();
        return null;
    }
    public void Getdisplayopp1(){
        
        opp = new List<Opportunity>();
        opp1 = new List<Opportunity>();
        tsk =  new List<Task>();
        oppid = new Set<Id>();
        opp = [select id,name,(select id from Tasks) from Opportunity];
        for(Opportunity op:opp){
            if(op.tasks.size()>0){
                oppid.add(op.id);                
            }
        }
        opp1 = [select id,name,stagename,closedate,(select id,subject from Tasks) from Opportunity where id=:oppid];
       // tsk=[select id,Subject,WhatId from Task where WhatId=:oppid];
        System.debug('opp##' +opp1);
        
    }
}