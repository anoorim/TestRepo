public class AccountBatchScheduler implements Schedulable{

    public void execute(SchedulableContext sc){
        Database.executeBatch(new AccountBatch());
    }
}