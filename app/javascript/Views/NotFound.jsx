import React from 'react'

function NotFound ({children}) {
  return (
    <div className='flex items-center h-full'>
      <span className='m-8 text-4xl text-gray-400'>
        
        { 
          children ?? <div> 
            Not Pokemons Found 
            <span className='flex rotate-90 transform-gpu'>{':['}</span> 
          </div>
        }
      </span>
    </div>
  )
}

export default NotFound