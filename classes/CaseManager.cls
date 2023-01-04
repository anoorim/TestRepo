@RestResource(urlMapping='/Cases/*')

global with sharing  class CaseManager {

    @httpget
    global static Case getCasebyId(){
        
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result=[select casenumber,subject,status,origin,priority from case where id=:caseId];
        return result;
        
    }
    
    @httppost
    global static ID createCase(String subject,String status,String origin,String priority)
    {
        Case thisCase=new Case(Subject=subject,Status=status,Origin=origin,Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }
    
    @httpdelete
    global static void deleteCase()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        case thisCase=[select id from case where id=:caseId];
        delete thisCase;
    }
    
    @httpput
    global static ID upsertCase(String subject,String status,String origin,String priority,String id)
    {
        Case thisCase=new Case(Subject=subject,Status=status,Origin=origin,Priority=priority,Id=id);
        upsert thisCase;
        return thisCase.id;
    }
    
    @httppatch
    global static ID updateCaseFields()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case thisCase=[select Id from case where id=:caseId];
        Map<String,Object> params=(Map<String,Object>) JSON.deserializeUntyped(request.requestBody.tostring());
        for(String fieldname:params.keySet())
        {
            thisCase.put(fieldname,params.get(fieldname));
        }
        update thisCase;
        return thisCase.id;
    }
}