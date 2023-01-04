global class BatchSchedule implements Schedulable{

    global void execute(SchedulableContext sc)
    {
       
     
       Database.executeBatch(new BatchEx());
      
           
    }
}