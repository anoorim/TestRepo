import { LightningElement } from 'lwc';
 
export default class BubbleExampleParentComp extends LightningElement {

    showNotification = false;
    showHandler(){
        this.showNotification = true;
    }
}