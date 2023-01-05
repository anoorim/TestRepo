import { LightningElement, wire } from 'lwc';
import getContactDetails from '@salesforce/apex/contactDisplayController.getContactDetails';


const columns = [
    { label: 'Id', fieldName: 'Id',type:'text' },
    { label: 'FirstName', fieldName: 'FirstName',type:'text'},
    { label: 'LastName', fieldName: 'LastName' ,type:'text'}
];
export default class ContactDisplay extends LightningElement {

    fname;
    lname;
    conData = [];
    conColumns = columns;
    
    handleInput(event){

        if(event.target.name === 'FirstName'){
            this.fname = event.target.value;
            console.log('fname@@' ,this.fname);
        }else{
            this.lname = event.target.value;
            console.log('lname@@' ,this.lname);
        }
    }

    getContactData(){
        console.log('calling apex class@@@');
        getContactDetails({fname :this.fname,lname : this.lname})
        .then(result=>{
            console.log('result@@@' ,JSON.stringify(result));
            this.conData = result;
            console.log('condata@@@' ,this.conData);
        })
        .catch(error=>{
    
        })
    }
   
}