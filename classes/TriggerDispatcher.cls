public class TriggerDispatcher {
    
    public static void run(TriggerInterface handler,System.TriggerOperation operationType){
        
        switch on operationType{
            
            when BEFORE_INSERT{
                handler.beforeInsert(Trigger.New);
            }
            when AFTER_INSERT{
                handler.afterInsert(Trigger.New, Trigger.NewMap);
            }
            when BEFORE_UPDATE{
                handler.beforeUpdate(Trigger.NewMap, Trigger.OldMap);
            }
            when AFTER_UPDATE{
                handler.afterUpdate(Trigger.NewMap, Trigger.OldMap);
            }
            when BEFORE_DELETE{
                handler.beforeDelete(Trigger.Old, Trigger.OldMap);
            }
            when AFTER_DELETE{
                handler.afterDelete(Trigger.OldMap);
            }
            when AFTER_UNDELETE{
                handler.afterUndelete(Trigger.New, Trigger.NewMap);
            }
        }
    }
}