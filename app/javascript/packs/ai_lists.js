myStorage = window.localStorage

document.addEventListener("DOMContentLoaded", () => {
    addEventsToActors()
    displayActors()
})

function addEventsToActors(){
    actorList = document.getElementById('actor_list').querySelectorAll('div')

    actorList.forEach(actor => {
        actor.addEventListener('click', event => {
            if (myStorage.actor_1 === undefined){
                myStorage.setItem('actor_1', event.target.id)
                myStorage.setItem('actor_1_name', event.target.innerText) 
                displayActors()
            }
            else {
                myStorage.setItem('actor_2', event.target.id)
                myStorage.setItem('actor_2_name', event.target.innerText)
                displayActors()
                displaySubmitButton()
            }
        })
    })
}

function displayActors(){
    if (myStorage.actor_1 !== undefined){
        actor1Div = document.getElementById('actor_1')
        actor1Div.innerText = `Actor 1: ${myStorage.actor_1_name}`
    }
    if (myStorage.actor_2 !== undefined){
        actor2Div = document.getElementById('actor_2')
        actor2Div.innerText = `Actor 2: ${myStorage.actor_2_name}`
    }
}

function displaySubmitButton(){
    submitButton = document.createElement('button')
    submitButton.innerText = 'Submit Actors'
    actor2Div.after(submitButton)
}
