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
                removeActorsButton()
            }
            else {
                myStorage.setItem('actor_2', event.target.id)
                myStorage.setItem('actor_2_name', event.target.innerText)
                displayActors()
                removeActorsButton()
                submitButton()
            }
        })
    })
}

function displayActors(){
    actor1Div = document.getElementById('actor_1')
    actor2Div = document.getElementById('actor_2')

    if (myStorage.actor_1 !== undefined){
        actor1Div.innerText = `Actor 1: ${myStorage.actor_1_name}`
    }
    if (myStorage.actor_2 !== undefined){
        actor2Div.innerText = `Actor 2: ${myStorage.actor_2_name}`
    }
}

function submitButton(){
    submitButton = document.createElement('button')
    submitButton.innerText = 'Submit Actors'
    actorSelections.after(submitButton)
}

function removeActorsButton(){
    removeActorsButton = document.createElement('button')
    removeActorsButton.innerText = 'Remove Actors'

    removeActorsButton.addEventListener('click', () => {
        myStorage.clear()
        actor1Div.innerText = `Actor 1: `
        actor2Div.innerText = `Actor 2: `
        removeActorsButton.remove()
    })

    actorSelections = document.getElementById('actor_selections')
    actorSelections.after(removeActorsButton)
}
