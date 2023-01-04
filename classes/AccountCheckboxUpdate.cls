public class AccountCheckboxUpdate {
    
    @InvocableMethod(label='accountCheckBoxUpdate')
    public static void updateAccount(List<Contact> conList){
        
        Set<String> mailingSet = new Set<String>();
        Set<String> ratingSet = new Set<String>();
        for(Contact con:conList){
            mailingSet.add(con.MailingCity);
            ratingSet.add(con.Custom__c);
        }
        List<Account> accList = [SELECT Rating,BillingCity FROM Account where Rating IN:ratingSet AND BillingCity IN:mailingSet];
        List<Account> updateAccList = new List<Account>();
        for(Account acc:accList){
            acc.pbCheckbox__c = true;
            updateAccList.add(acc);
        }
        IF(!updateAccList.isEmpty()){
            Database.update(updateAccList);
        }
    }
}