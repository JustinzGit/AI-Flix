document.addEventListener("DOMContentLoaded", () => {

    submitButton = document.getElementsByTagName('input')[3]

    submitButton.addEventListener('click', () => {
        preLoader = document.getElementById('preloader')
        setTimeout(() => {
            preLoader.setAttribute('style', 'display:flex')
        }, 1000)
    })
})