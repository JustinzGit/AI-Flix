myStorage = window.localStorage

document.addEventListener("DOMContentLoaded", () => {
    actor1Div = document.getElementById('actor_1')
    actor2Div = document.getElementById('actor_2')

    // add onclick events to actors in search resutls
    addEventsToActors()

    // display actors on page if in local storage
    displayActors()
})

function addEventsToActors(){

    // grab list of actors from search results
    actorList = document.getElementById('actor_list').querySelectorAll('div')

    // add on click event to each actor
    actorList.forEach(actor => {
        actor.addEventListener('click', event => {

            // if actor 1 is not in local storage
            if (myStorage.actor_1 === undefined){
                myStorage.setItem('actor_1', event.target.id)
                myStorage.setItem('actor_1_name', event.target.innerText)
                
                // display actors on page that have been set
                displayActors()

                // add button to remove actors
                removeActorsButton()
            }

            // if actor 2 is not in local storage
            else {
                myStorage.setItem('actor_2', event.target.id)
                myStorage.setItem('actor_2_name', event.target.innerText)

                // display actors on page that have been set
                displayActors()

                // add button to remove actors
                removeActorsButton()

                // add button to submit actors
                submitButton()
            }
        })
    })
}

// display actors on page if in local storage
function displayActors(){
    if (myStorage.actor_1 !== undefined){
        actor1Div.innerText = `Actor 1: ${myStorage.actor_1_name}`
    }
    if (myStorage.actor_2 !== undefined){
        actor2Div.innerText = `Actor 2: ${myStorage.actor_2_name}`
    }
}

// button to submit actors to generate ai movie list
function submitButton(){
    submitButton = document.createElement('button')
    submitButton.innerText = 'Submit Actors'
    actorSelections.after(submitButton)
}

// button to remove actors from DOM and clear local storage
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
