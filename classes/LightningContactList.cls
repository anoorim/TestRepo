public class LightningContactList {

    @AuraEnabled
    public static List<Contact> getContacts(){
        
        List<Contact> conList = [select id,email,lastname,department from contact];
        return conList;
    }
    
}