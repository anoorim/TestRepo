public class SoundManagerController {

    @AuraEnabled
    public static List<SoundManager__c> showSounds()
    {
        return [select name,path__c from SoundManager__c order by name];
    }
}