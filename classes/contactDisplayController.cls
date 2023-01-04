public with sharing class contactDisplayController {
    
    @AuraEnabled(cacheable = true)
    public static List<Contact>  getContactDetails(String fname,String lname){
        try {
            return [SELECT Id,FirstName,LastName FROM Contact WHERE FirstName= :fname AND LastName= :lname];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}