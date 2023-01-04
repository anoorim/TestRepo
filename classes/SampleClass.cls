public with sharing class SampleClass {
    private ApexPages.StandardSetController setController;

    public SampleClass(ApexPages.StandardSetController setController) {
        this.setController = setController;
        
        Account [] records = [SELECT Id, Name,Rating FROM Account LIMIT 5];
        setController.setSelected(records);
    }
}