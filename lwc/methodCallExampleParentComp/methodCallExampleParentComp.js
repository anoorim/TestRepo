import { LightningElement } from 'lwc';
 
export default class MethodCallExampleParentComp extends LightningElement {

    changeColor(){
        this.template.querySelector('c-method-call-example-child-comp').changeBarColor();
    }
}