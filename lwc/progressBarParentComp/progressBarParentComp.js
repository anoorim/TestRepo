import { LightningElement } from 'lwc';
 
export default class ProgressBarParentComp extends LightningElement {
    
    percentage = 10;

    changeHandler(event){
        this[event.target.name] = event.target.value <=100 ? event.target.value : 100;
    }
}