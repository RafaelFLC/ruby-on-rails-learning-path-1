import React from 'react'
import { Link } from 'react-router-dom'

import ColorSpan from '../ColorSpan'

function BtnAddPokemon ({ children }) {
  return (
    <div className="flex h-14 w-full justify-center">
      <Link to="/search" 
          className="flex justify-center w-full text-center rounded-lg shadow-lg m-2 p-2 md:w-1/3 items-center bg-gray-200 dark:bg-gray-600 dark:text-gray-400">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
              </svg>
              
              { children ?? <span>Add <ColorSpan>P</ColorSpan>okemons</span> }
      </Link>
    </div>
  )
}

export default BtnAddPokemon