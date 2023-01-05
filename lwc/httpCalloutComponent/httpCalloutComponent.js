import { LightningElement } from 'lwc';
import getCurrencyData from '@salesforce/apex/CurrencyConversioncontroller.retrieveCurrencyConversionrates';

const options=
[
    {label:'USD',value:'USD'},
    {label:'EUR',value:'EUR'},
    {label:'CAD',value:'CAD'},
    {label:'GBP',value:'GBP'},
    {label:'INR',value:'INR'}
];

export default class HttpCalloutComponent extends LightningElement {

    fromCurrencyValue;
    toCurrencyValue;
    options=options;
    toCurrencyOptions=options;
    conversionData;

    handleFromCurrencyChange(event)
    {
        this.fromCurrencyValue=event.detail.value;
        console.log('this.fromCurrencyValue=> '+this.fromCurrencyValue);
    }

    handleToCurrencyChange(event)
    {
        this.toCurrencyValue=event.detail.value;
        console.log('this.toCurrencyValue=> '+this.toCurrencyValue);
    }

    /****Direct Call to Api */
    /*handleCurrencyConversion(){

        fetch('https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency='+this.fromCurrencyValue+'&to_currency='+this.toCurrencyValue
        +'&apikey=Z9gtmCzMFWHnJZvK1LMIRKoDmCIlrYzn',
        {
            method : 'GET',
            headers : {
                "Content-type" : "application/json",
                "Authorization" : "OAuth 00D0o000000SfhP!AQsAQCdEwFpAiCvrRiUCNkus_8OZPaAf0LpqpR_xwYMTeqH5Z3MMy2ZAZcRGcAq7A6lvKswErOXP5iwE31cL5Kp7pRKL9yE2"
            }
        })
        .then((response) =>
        { 
            return response.json()
        })
        .then(jsonResponse =>{
            let objData={
                From_Currency_Name : '',
                From_Currency_Code : '',
                To_Currency_Name : '',
                To_Currency_Code : '',
                Last_Refreshed : '',
                Exchange_Rate : ''
            };
            console.log('jsonresponse@@@' ,JSON.stringify(jsonResponse));

            let exchangeData = jsonResponse['Realtime Currency Exchange Rate'];
            console.log('exchangeData@@@' ,JSON.stringify(exchangeData));

            objData.From_Currency_Name = exchangeData['2. From_Currency Name'];
            objData.From_Currency_Code = exchangeData['1. From_Currency Code'];
            objData.To_Currency_Name = exchangeData['4. To_Currency Name'];
            objData.To_Currency_Code = exchangeData['3. To_Currency Code'];
            objData.Last_Refreshed = exchangeData['6. Last Refreshed'];
            objData.Exchange_Rate = exchangeData['5. Exchange Rate'];
            this.conversionData = objData;
        }).catch(error =>{
            console.log('callout error' +JSON.stringify(error));
        })
    }*/
        
     /****Api call from controller */
     handleCurrencyConversion()
    {
        //rest api call
        //check the respons
        //display the response
        let endpoint='https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency='+this.fromCurrencyValue+'&to_currency='+this.toCurrencyValue
        +'&apikey=Z9gtmCzMFWHnJZvK1LMIRKoDmCIlrYzn';
        getCurrencyData({strEndPointURL : endpoint})
        .then(data =>{
            let objData={
                From_Currency_Name:'',
                From_Currency_Code:'',
                To_Currency_Name:'',
                To_Currency_Code:'',
                Last_Refreshed:'',
                Exchange_rate:''
            };
    
      
        window.console.log('jsonresponse ===>'+JSON.stringify(data));
        let exchangeData=data['Realtime Currency Exchange Rate'];
        window.console.log('exchangeData==>'+JSON.stringify(exchangeData));

        objData.From_Currency_Code=exchangeData['1. From_Currency Code'];
        objData.From_Currency_Name=exchangeData['2. From_Currency Name'];
        objData.To_Currency_Name=exchangeData['4. To_Currency Name'];
        objData.To_Currency_Code=exchangeData['3. To_Currency Code'];
        objData.Last_Refreshed=exchangeData['6. Last Refreshed'];
        objData.Exchange_rate=exchangeData['5. Exchange Rate'];
        this.conversionData=objData;
        window.console.log('objData => '+JSON.stringify(objData));
    }).catch(error=>{
        window.console.log('callout error '+JSON.stringify(error));
    })
    }
}