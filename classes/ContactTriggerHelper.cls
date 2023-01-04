public class ContactTriggerHelper {
    
    /****Method to calculate rollup of contacts and update on account****/
    public static void RollupAccount(List<Contact> conList,List<Contact> conListOld){
        
        List<Account> accUpdateList = new List<Account>();
        Set<Id> accIdSet = new Set<Id>();
        Set<Id> accIdSetOld = new Set<Id>();
        
        if(conList != null){
            for(Contact con:conList){
                accIdSet.add(con.AccountId);
            }  
            for(Account a:[SELECT Id,RollUp_Trigger__c,(select id from contacts) from Account where id=:accIdSet]){
                a.RollUp_Trigger__c = a.contacts.size();
                accUpdateList.add(a);
            }
        }
        if(conListOld!=null){
            for(Contact con:conListOld){
                accIdSetOld.add(con.AccountId);
            }
            for(Account a:[SELECT Id,RollUp_Trigger__c,(select id from contacts) from Account where id=:accIdSetOld]){
                a.RollUp_Trigger__c = a.contacts.size();
                accUpdateList.add(a);
            }
        }
        Database.SaveResult[] saveResult = Database.update(accUpdateList);
        for(Database.SaveResult sr:saveResult){
            If(sr.isSuccess()){
                
            }else{
                for(Database.Error err:sr.getErrors()){
                    System.debug('Errors@@@' +err);
                }
            }
        }
    }
    
    /****Method to check duplicate contacts based on Email***/
    public static void duplicateCheck(List<Contact> conList){
        
        Set<String> emailSet = new Set<String>();
        Set<String> existingemailSet = new Set<String>();
        for(Contact con:conList){
            if(con.Email != null){
                emailSet.add(con.Email);
            }
        }
        List<Contact> existingConList = [select id,email from contact where email=:emailSet];
        for(Contact econ:existingConList){
            existingemailSet.add(econ.Email);
        }
        for(Contact con:conList){
            if(existingemailSet.contains(con.Email)){
                con.addError('Duplicate Contact exists with the same email.Please enter a new email address');
            }else{
                existingemailSet.add(con.Email);
            }
        }
    }
}