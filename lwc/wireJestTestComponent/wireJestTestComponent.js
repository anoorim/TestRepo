import { LightningElement,wire } from 'lwc';
import getContactLists from '@salesforce/apex/ContactController.getContactLists';

export default class WireJestTestComponent extends LightningElement {

    contactData = [];
    errorVal;

    @wire(getContactLists)
        contacts({data,error}){
            if(data){
                this.contactData = data;
            }if(error){
                this.errorVal = error;
            }

        };


    renderedCallback(){
        console.log(JSON.stringify(this.contactData));
    }
}