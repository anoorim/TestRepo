public class ParkLocator {

    public static List<String> country(String country)
    {
        List<String> parkname;
     	ParkService.ParksImplPort park=new ParkService.ParksImplPort();
        parkname=park.byCountry(country);
        System.debug('Park name' +parkname);
        return parkname;
    }
}