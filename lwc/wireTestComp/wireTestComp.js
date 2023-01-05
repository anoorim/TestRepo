import { LightningElement, wire } from 'lwc';
import getAccount from '@salesforce/apex/wireMethodTestController.getAccounts'
 
const columns = [
    { label: 'Name', fieldName: 'Name'},
    { label: 'Type', fieldName: 'Type', type: 'String' },
    { label: 'Industry', fieldName: 'Industry', type: 'String' }
];
export default class WireTestComp extends LightningElement {

    acc = [];
    columns = columns;

    @wire(getAccount)
    wiredAccount(data,error){
        if(data){
            console.log('data@@@@' ,JSON.stringify(data));
            this.acc = data;
            console.log("acc" ,JSON.stringify(this.acc));
        }
       
    }
    
}