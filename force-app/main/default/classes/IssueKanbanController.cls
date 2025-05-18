public with sharing class IssueKanbanController {
    @AuraEnabled(cacheable=true)
    public static Map<String, List<Issue__c>> getIssuesByStatus() {
        Map<String, List<Issue__c>> result = new Map<String, List<Issue__c>>();
        List<Issue__c> issues = [SELECT Id, Name, Description__c, Status__c FROM Issue__c];
        for (Issue__c issue : issues) {
            String status = issue.Status__c;
            if (!result.containsKey(status)) {
                result.put(status, new List<Issue__c>());
            }
            result.get(status).add(issue);
        }
        return result;
    }
}
