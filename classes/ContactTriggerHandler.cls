public class ContactTriggerHandler implements TriggerInterface{
    
    public static void beforeInsert(List<sObject> newRecordsList){
        
        List<Contact> contactList = (List<Contact>)newRecordsList;
        ContactTriggerHelper.duplicateCheck(contactList);
    }
    public static void afterInsert(List<sObject> newRecordsList,Map<Id,sObject> newRecordsMap){
        
        List<Contact> contactList = (List<Contact>)newRecordsList;
        ContactTriggerHelper.RollupAccount(contactList,null);
    }
    
    public static void beforeUpdate(Map<Id,sObject> newRecordsMap,Map<Id,sObject> oldRecordsMap){
       
    }
    
    public static void afterUpdate(Map<Id,sObject> newRecordsMap,Map<Id,sObject> oldRecordsMap){
        
        List<Contact> newContacts = (List<Contact>)newRecordsMap.values();
        List<Contact> oldContacts = (List<Contact>)oldRecordsMap.values();
        List<Contact> conList = new List<Contact>();
        List<Contact> conListOld = new List<Contact>();
        for(Contact con:newContacts){
            Contact oldCon = (Contact)oldRecordsMap.get(con.Id);
            if(con.AccountId != oldCon.AccountId){
                conList.add(con);
                conListOld.add(oldCon);
            }
        }
        if(conList.size()>0){
            ContactTriggerHelper.RollupAccount(conList,conListOld);
        }
    }
    
    public static void beforeDelete(List<sObject> oldRecordsList,Map<Id,sObject> oldRecordsMap){
        
    }
    
    public static void afterDelete(Map<Id,sObject> oldRecordsMap){
        List<Contact> contactList = (List<Contact>)oldRecordsMap.values();
        ContactTriggerHelper.RollupAccount(contactList,null);
    }
    
    public static void afterUndelete(List<sObject> newRecordsList,Map<Id,sObject> newRecordsMap){
        List<Contact> contactList = (List<Contact>)newRecordsList;
        ContactTriggerHelper.RollupAccount(contactList,null);
    }
}