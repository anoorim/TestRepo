global class AccountBatch implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        String query='select id,Pipeline_Amount__c,(select Amount from Opportunities) from Account where piplineupdated__c=false';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account> accList){
        
        for(Account acc:accList){
            if(acc.Opportunities.size()>0){
                for(Integer i=0;i<acc.Opportunities.size();i++){
                    if(acc.Opportunities[i].Amount != null){
                        if(acc.piplineupdated__c == null){
                            acc.Pipeline_Amount__c = 0;
                        }
                        acc.Pipeline_Amount__c += acc.Opportunities[i].Amount;
                    }
                    acc.piplineupdated__c = true;
                }
            }
        }  
        Database.update(accList);
        system.debug('abcd');
    }
    global void finish(Database.BatchableContext bc){
        
    }
}