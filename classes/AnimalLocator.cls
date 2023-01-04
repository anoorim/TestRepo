public class AnimalLocator {
    
    public static String getAnimalNameById(integer id)
    {
       	String name;
        Http http=new Http();
        Httprequest request=new Httprequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' +id);
        request.setMethod('GET');
        Httpresponse response=http.send(request);
        if(response.getStatusCode()==200)
        {
            Map<String,Object> result=(Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> animals=(Map<String,Object>) result.get('animal');
            name=String.valueOf(animals.get('name'));  
            System.debug('Animal name' +name);
        }
        return name;
    }
}