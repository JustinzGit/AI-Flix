myStorage = window.localStorage

document.addEventListener("DOMContentLoaded", () => {
    actor1Div = document.getElementById('actor-1')
    actor2Div = document.getElementById('actor-2')
    actorSelections = document.getElementById('actor-selections')

    // add onclick events to actors in search resutls
    addEventsToActors()

    // display actors on page if in local storage
    displayActors()

    // display buttons to remove actors or submit selections
    addButtons()
})

function addEventsToActors(){

    // grab list of actors from search results
    actorList = document.getElementById('search-results').querySelectorAll('div')

    // add on click event to each actor
    actorList.forEach(actor => {
        actor.addEventListener('click', event => {

            // if actor 1 is not in local storage
            if (myStorage.actor_1 === undefined){
                myStorage.setItem('actor_1', event.target.id)
                myStorage.setItem('actor_1_name', event.target.innerText)
                
                // display actors on page that have been set
                displayActors()

                // display button to remove actors
                removeActorsButton()
                
            }

            // if actor 2 is not in local storage
            else {
                myStorage.setItem('actor_2', event.target.id)
                myStorage.setItem('actor_2_name', event.target.innerText)

                // display actors on page that have been set
                displayActors()

                // display button to submit actors
                submitActorsButton()
            }
        })
    })
}

// display actors on page if in local storage
function displayActors(){
    if (myStorage.actor_1 !== undefined){
        redTextDiv = document.createElement('div')
        redTextDiv.setAttribute('class', 'red-text-block')
        redTextDiv.innerText = 'Actor 1: '
        
        whiteTextDiv = document.createElement('div')
        whiteTextDiv.setAttribute('class', 'white-text-block')
        whiteTextDiv.innerText = `${myStorage.actor_1_name}`

        actor1Div.appendChild(redTextDiv)
        redTextDiv.appendChild(whiteTextDiv)
    }

    if (myStorage.actor_2 !== undefined){
        redTextDiv = document.createElement('div')
        redTextDiv.setAttribute('class', 'red-text-block')
        redTextDiv.innerText = 'Actor 2: '
        
        whiteTextDiv = document.createElement('div')
        whiteTextDiv.setAttribute('class', 'white-text-block')
        whiteTextDiv.innerText = `${myStorage.actor_2_name}`
    } 
}

// button to submit actors to generate ai movie list
function submitActorsButton(){
    submitButton = document.createElement('button')
    submitButton.innerText = 'Submit Actors'
    token = document.getElementsByName('csrf-token')[0].content

    submitButton.addEventListener('click', () => {
       window.location = 'http://localhost:3000/ai_movie_routes/generate?' + new URLSearchParams({
            actor_1: myStorage.actor_1,
            actor_2: myStorage.actor_2,
        })
    })

    actorSelections.after(submitButton)
}

// button to remove actors from DOM and clear local storage
function removeActorsButton(){
    if (myStorage.actor_1 !== undefined || myStorage.actor_1 !== undefined){
        removeButton = document.createElement('button')
        removeButton.innerText = 'Remove Actors'

        removeButton.addEventListener('click', () => {
            myStorage.clear()
            actor1Div.innerText = `Actor 1: `
            actor2Div.innerText = `Actor 2: `
            removeButton.remove()

            // remove submit button if it has been added
            if (typeof(submitButton) !== 'undefined') submitButton.remove()
        })

        actorSelections.after(removeButton)
    }
}

// adds buttons to remove actors or submit actors 
function addButtons(){

    // if both actors are present in storage
    if (myStorage.length === 4){

        // add button to remove actors 
        removeActorsButton()

        // add button to submit actors 
        submitActorsButton()
    }
    else if (myStorage.length == 2){
        removeActorsButton()
    }
}
