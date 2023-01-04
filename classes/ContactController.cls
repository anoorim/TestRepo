public with sharing class ContactController {

    @AuraEnabled(cacheable = true)
    public static List<Contact> getContactLists(){
        return [SELECT Name FROM Contact LIMIT 5];
    }
}