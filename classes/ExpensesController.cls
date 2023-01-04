public with sharing class ExpensesController {

    @AuraEnabled
    public static List<Expense__c> getExpenses()
    {
        return [select id,name,amount__c,client__c,Date__c,Reimbursed__c,CreatedDate from Expense__c];
    }
    
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense)
    {
        upsert expense;
        return expense;
    }
}