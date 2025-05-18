import { LightningElement } from 'lwc';
import getIssuesByStatus from '@salesforce/apex/IssueKanbanController.getIssuesByStatus';

export default class IssueKanban extends LightningElement {
    columns = ['To Do', 'In Progress', 'Code Review', 'QA', 'Done'];
    columnsData = [];
    error;

    connectedCallback() {
        this.loadIssues();
    }

    loadIssues() {
        getIssuesByStatus()
            .then(result => {
                this.columnsData = this.columns.map(status => ({
                    status,
                    issues: result[status] || []
                }));
            })
            .catch(error => {
                this.error = error;
                console.error('Error loading issues:', error);
            });
    }

    get hasData() {
        return this.columnsData.length > 0;
    }
}
