import { LightningElement } from 'lwc';
 
export default class BubbleExampleChildComp extends LightningElement {
    showChildNotification = false;
    childHandler() {
        this.showChildNotification = true;
    }
    showNotifyParent(event) {
        event.preventDefault();
        const selectEvent = new CustomEvent('show', {
            bubbles: true
        });
        this.dispatchEvent(selectEvent);
    }
}