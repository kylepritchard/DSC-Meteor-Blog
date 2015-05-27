@AccountsEntry.config
    logo: 'logo.png'
    homeRoute: '/'
    dashboardRoute: '/'
    profileRoute: 'profile'
    passwordSignupFields: 'EMAIL_ONLY'
    showSignupCode: false
    showOtherLoginServices: true
    extraSignUpFields: [ {
        field: 'username'
        name: 'Username'
        label: 'Username'
        placeholder: 'John Doe'
        type: 'text'
        required: true
    }
    {
    field: 'realname'
    name: 'Real Name'
    label: 'Real Name'
    placeholder: 'John Doe'
    type: 'text'
    required: true
    } ]
