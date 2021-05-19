document.addEventListener("DOMContentLoaded", () => {

    // If on signup page 
    submitButton = document.getElementsByTagName('input')[5]

    // If on login page
    if (submitButton === undefined){
        submitButton = document.getElementsByTagName('input')[3]
    }

    submitButton.addEventListener('click', () => {
        preLoader = document.getElementById('preloader')
        setTimeout(() => {
            preLoader.setAttribute('style', 'display:flex')
        }, 1000)
    })
})