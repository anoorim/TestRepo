public class EmailExample {
    
    public pagereference show()
    {
        EmailTemplate templateId=[Select id from EmailTemplate where name='Birthday'];
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        contact c=[select id,email from contact where lastname='Kumar'];
        string[] toAddress=new string[]{'anoori.m@gmail.com'};
        string[] toCCAddress=new string[]{'kumar.sandip29@gmail.com'};
        msg.setToAddresses(toAddress);
        msg.setCcAddresses(toCCAddress);
        msg.setTemplateId(templateid.id);
        msg.setTargetObjectId(c.id); // passing the id of contact
        msg.setTreatTargetObjectAsRecipient(false); // to prevent the contact from recieving the email
        msg.setBccAddresses(toCCAddress);
        msg.setPlainTextBody('Hi , How are you');
        msg.setSubject('test Mail');
        messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});
        //return page.AccntContactQueryPage;
        return null;
    }
}