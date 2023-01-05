import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class LwcTolwcNavigation extends  NavigationMixin(LightningElement) {

    text = ""; //for taking user input
    handleChange(event) {
        this.text = event.target.value;
        console.log(this.text);
    }
    handleClick() {
        console.log('calling handle click !!!!');
        let compDefinition = { 
            componentDef: "c:lwcTolwcNavigationSecondComp",
            attributes: {
                parentMessage : this.text != "" ? this.text : "No Name Provided."
            }
        };
        // Base64 encode the compDefinition JS object
        let encodedCompDef = btoa(JSON.stringify(compDefinition));
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
                url: "/one/one.app#" + encodedCompDef
            }
        });
    }
}