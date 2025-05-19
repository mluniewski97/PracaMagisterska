@isTest
private class IssueKanbanControllerTest {
    @isTest
    static void testGetIssuesByStatus() {
        Issue__c issue1 = new Issue__c(Name='Issue 1', Description__c='Desc 1', Status__c='To Do');
        Issue__c issue2 = new Issue__c(Name='Issue 2', Description__c='Desc 2', Status__c='In Progress');
        Issue__c issue3 = new Issue__c(Name='Issue 3', Description__c='Desc 3', Status__c='To Do');
        Issue__c issue4 = new Issue__c(Name='Issue 4', Description__c='Desc 4', Status__c='Done');

        insert new List<Issue__c>{ issue1, issue2, issue3, issue4 };

        Test.startTest();
        Map<String, List<Issue__c>> result = IssueKanbanController.getIssuesByStatus();
        Test.stopTest();

        System.assertEquals(3, result.size(), 'Powinny być 3 różne statusy');
        System.assert(result.containsKey('To Do'), 'Brak statusu To Do');
        System.assert(result.containsKey('In Progress'), 'Brak statusu In Progress');
        System.assert(result.containsKey('Done'), 'Brak statusu Done');
        System.assertEquals(2, result.get('To Do').size(), 'Status To Do powinien mieć 2 rekordy');
        System.assertEquals(1, result.get('In Progress').size(), 'Status In Progress powinien mieć 1 rekord');
        System.assertEquals(1, result.get('Done').size(), 'Status Done powinien mieć 1 rekord');
    }
}