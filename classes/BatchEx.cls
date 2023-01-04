public class BatchEx implements Database.Batchable<sObject>,Database.Stateful{

    public Database.QueryLocator start(Database.BatchableContext bc){
        
       String q='select id,name from lead';
       return Database.getQueryLocator(q);
    }
    public  void execute(Database.BatchableContext bc,List<Lead> ld)
    {
        List<Lead> ledList=new List<Lead>();
        for(Lead led:ld)
        {
            led.LeadSource='Phone';
            //ledList.add(led);
        }
        Database.update(ld);
    }
    public  void finish(Database.BatchableContext bc)
    {
        
    }
}