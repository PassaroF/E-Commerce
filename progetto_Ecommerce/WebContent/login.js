/**
 * 
 */


    const form = document.getElementById('form');
    const username = document.getElementById('username');
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');

    form.addEventListener('submit', e => {
        e.preventDefault();

        validateInputs();
    });
    

    const isValidEmail = email => {
        const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    const validateInputs = () => {
        const usernameValue = username.value.trim();
        const emailValue = email.value.trim();
        const passwordValue = password.value.trim();
        const password2Value = password2.value.trim();
        const flag=0;

        if(usernameValue === '') {
        	const inputControl = username.parentElement;
            const errorDisplay = inputControl.querySelector('.error');
            errorDisplay.innerText = "username errata";
            inputControl.classList.add('error');
            inputControl.classList.remove('success');
            flag=1;
            
        } else {
        	const inputControl = username.parentElement;
            const errorDisplay = inputControl.querySelector('.error');

            errorDisplay.innerText = '';
            inputControl.classList.add('success');
            inputControl.classList.remove('error');
        }

        if(emailValue === '') {
        	const inputControl = email.parentElement;
            const errorDisplay = inputControl.querySelector('.error');
            errorDisplay.innerText = "email errata";
            inputControl.classList.add('error');
            inputControl.classList.remove('success');
            flag=1;
        } else if (!isValidEmail(emailValue)) {
            
        } else {
            
        }

        if(passwordValue === '') {
            
        } else if (passwordValue.length < 2 ) {
            
        } else {
            
        }

        if(password2Value === '') {
            
        } else if (password2Value !== passwordValue) {
            
        } else {
           
            
        }
        if (flag==1){
        	return false;
        	const inputControl = email.parentElement;
            const errorDisplay = inputControl.querySelector('.error');
            errorDisplay.innerText = "flag errata";
            inputControl.classList.add('error');
            inputControl.classList.remove('success');
        }else {
        	
        	return;
        }

    };
    