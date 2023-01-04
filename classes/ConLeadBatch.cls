public class ConLeadBatch implements Database.Batchable<sObject>,Database.Stateful {
    
    public final String Query;
    public final String Field;
    //public  String Value;
    
    public ConLeadBatch(String qry, String f)
    {
        Query = qry ;
        Field = f;
        //Value = val;
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator(Query);
        
    }
    public void execute(Database.BatchableContext BC, List<Sobject> sobj){
        
       // List<sObject> updatedList = new List<sObject>();
         List<sObject> updatedList = new List<sObject>();
        
        for(sObject Src : sobj){
            String email = Src.get('email')+'.invalid';
            Src.put(Field,email);
            updatedList.add(Src);
        }
        if(!updatedList.isEmpty()){
            update updatedList;
        }
        
    }
    public void finish(Database.BatchableContext BC){}
}