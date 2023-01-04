public with sharing class wireMethodTestController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id,Name,Type,Industry FROM Account WHERE Type='Prospect'];
    }
}