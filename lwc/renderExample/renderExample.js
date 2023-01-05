import { LightningElement } from 'lwc';
import signinTemplate from './signInTemplate.html';
import signupTemplate from './signUpTemplate.html';
import defaultTemplate from './renderExample.html';

export default class RenderExample extends LightningElement {
    selected = null;
    render(){
        return this.selected === 'Sign Up' ? signupTemplate:
        this.selected === 'Sign In' ? signinTemplate:
        defaultTemplate
    }

    handlClick(event){
        console.log("clicked !!!");
        this.selected = event.target.label;
    }

    submitHandler(event){
        if(event.target.label === 'Sign In'){
            alert("Sign in successful");
        }else if(event.target.label === 'Sign Up'){
            alert("Sign up successful");
        }else{

        }
    }
}