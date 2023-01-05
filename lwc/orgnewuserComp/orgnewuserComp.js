import { LightningElement } from 'lwc';
 
const options = [
    { label: 'First Name', value: 'First Name' },
    { label: 'Last Name', value: 'Last Name' },
    { label: 'Email Address', value: 'Email Address' },
    { label: 'Date of Birth', value: 'Date of Birth' }
];

const actions = [
    { label: 'Add User', name: 'add_user' }
];
const columns = [
    { label: 'NAME', fieldName: 'Name' },
    { label: 'EMAIL ADDRESS', fieldName: 'email', type: 'email' },
    { label: 'DATE OF BIRTH', fieldName: 'phone', type: 'phone' },
    { label: 'ACTION', fieldName: 'amount', type: 'currency' },
    { label: 'CloseAt', fieldName: 'closeAt', type: 'date' },
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];
export default class OrgnewuserComp extends LightningElement {
    searchParam;
    hasData;
    searchValue;
    searchKeyword;
    selectedOption;
    options = options;
    columns = columns;
    searchLabel = 'Search By';

    handleChange(event) {
         this.selectedOption = event.detail.value;
         const label =  event.detail.label;
         console.log('Option selected with value: ' + this.selectedOption);
         this.searchLabel = 'Search By '+this.selectedOption;
    }
    handleSearch(){

    }
}