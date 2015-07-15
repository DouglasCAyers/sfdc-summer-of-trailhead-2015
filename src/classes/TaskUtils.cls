/**
 * Example of @InvocableMethod annotation for
 * calling apex from Process Builder.
 * 
 * @see http://bobbuzzard.blogspot.com/2015/02/lightning-process-builder-and-invocable.html
 * 
 * @author Doug Ayers
 * Nashville Developer Group, 7/16/2015
 */
public with sharing class TaskUtils {

    /**
     * Usage: Process Builder evaluates criteria when account
     * becomes "validated" then invokes this apex method to delete
     * the related "Validate Account" tasks. 
     */
    @InvocableMethod
    public static void accountsValidated( List<ID> accountIds ) {
        
        List<Task> tasks = new List<Task>([
			select 
            	id
            from
            	task
            where
            	whatId in :accountIds
            	and
            	subject = 'Validate Account'
        ]);
        
        delete tasks;
    }
    
}